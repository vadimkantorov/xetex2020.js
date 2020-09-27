import os
import argparse

def traverse(preload):
    res_dirs, res_files = set(), set()
    for src_path, dst_path in preload:
        if os.path.isfile(src_path):
            print(f'Processing file [{src_path}]')
            splitted = dst_path.split(os.sep)[:-1]
            d = os.sep
            for s in splitted:
                d = os.path.join(d, s)
                res_dirs.add(d)
            res_files.add(dst_path)
        else:
            print(f'Processing directory [{src_path}]')
            for root, dirs, files in os.walk(src_path, topdown = True):
                res_dirs.add(root.replace(src_path, dst_path))
                res_dirs.update(os.path.join(root.replace(src_path, dst_path), name) for name in dirs)
                res_files.update(os.path.join(root.replace(src_path, dst_path), name) for name in files)
    
    res_dirs.remove('/')
    return list(sorted(res_dirs)), list(sorted(res_files))

def main(data_file, js_output, export_name, preload):
    dirs, files = traverse(preload)
    
    f = open(js_output, 'w')
    f.write(f'''var Module = typeof {export_name} !== 'undefined' ? {export_name}''' + ' : {};')
    f.write('(function() {\n')
    f.write('function runWithFS() { const FS = Module.FS, R = Module.locateFile("/"); const M = p => { try { FS.mkdir(p); } catch{} }, F = (dst_dir, dst_name, dst_path) => FS.createLazyFile(dst_dir, dst_name, R + dst_path, true, false);\n')
    f.writelines(f'M("{dst_dir}");\n' for dst_dir in dirs)
    f.writelines(f'F("{dst_dir}", "{dst_name}", "{dst_path}");\n' for dst_path in files for dst_dir, dst_name in [(os.path.dirname(dst_path), os.path.basename(dst_path))])
    f.write('}\n')
    f.write('''
    if (Module['calledRun']) {
      runWithFS();
    } else {
      if (!Module['preRun']) Module['preRun'] = [];
      Module["preRun"].push(runWithFS); // FS is not initialized yet, wait for it
    }''')
    f.write('})();')
    print(f'Written to [{js_output}]')

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    parser.add_argument('--preload', action = 'append', type = lambda s: s.split('@'))
    parser.add_argument('--js-output', required = True)
    parser.add_argument('--export-name', required = True)
    args, unknownargs = parser.parse_known_args()

    main(**vars(args))
