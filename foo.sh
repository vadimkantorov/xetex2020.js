ROOT=$PWD
TEXLIVE_SOURCE_DIR=$PWD/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/
TEXLIVE_BUILD_DIR=$PWD/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-wasm
EXPAT_BUILD_DIR=$PWD/expat-2.2.9/build-wasm
FONTCONFIG_BUILD_DIR=$PWD/fontconfig-2.13.1/build-wasm



XETEX_OBJECTS="xetex-xetex-pool.o     synctexdir/xetex-synctex.o xetex-xetexini.o xetex-xetex0.o xetexdir/libxetex_a-XeTeXFontInst.o xetexdir/libxetex_a-XeTeXFontMgr.o xetexdir/libxetex_a-XeTeXLayoutInterface.o xetexdir/libxetex_a-XeTeXOTMath.o xetexdir/libxetex_a-XeTeX_ext.o xetexdir/libxetex_a-XeTeX_pic.o xetexdir/libxetex_a-trans.o xetexdir/libxetex_a-hz.o xetexdir/libxetex_a-pdfimage.o $TEXLIVE_BUILD_DIR/texk/web2c/xetexdir/image/libxetex_a-pngimage.o $TEXLIVE_BUILD_DIR/texk/web2c/xetexdir/image/libxetex_a-bmpimage.o $TEXLIVE_BUILD_DIR/texk/web2c/xetexdir/image/libxetex_a-jpegimage.o xetexdir/libxetex_a-XeTeXFontMgr_FC.o"
XETEX_DEPS="$TEXLIVE_BUILD_DIR/libs/harfbuzz/libharfbuzz.a $TEXLIVE_BUILD_DIR/libs/graphite2/libgraphite2.a $TEXLIVE_BUILD_DIR/libs/teckit/libTECkit.a $TEXLIVE_BUILD_DIR/libs/libpng/libpng.a $TEXLIVE_BUILD_DIR/libs/freetype2/libfreetype.a      $TEXLIVE_BUILD_DIR/libs/zlib/libz.a libmd5.a lib/lib.a $TEXLIVE_BUILD_DIR/texk/kpathsea/.libs/libkpathsea.a $FONTCONFIG_BUILD_DIR/src/.libs/libfontconfig.a $EXPAT_BUILD_DIR/libexpat.a $TEXLIVE_BUILD_DIR/libs/icu/icu-build/lib/libicuuc.a $TEXLIVE_BUILD_DIR/libs/icu/icu-build/lib/libicudata.a" 

# xetexdir/xetex-xetexextra.o
# $TEXLIVE_BUILD_DIR/libs/pplib/libpplib.a
pushd $TEXLIVE_BUILD_DIR/texk/web2c
/mnt/c/Users/user/emsdk/upstream/bin/wasm-ld --whole-archive --export-dynamic -relocatable $XETEX_OBJECTS $XETEX_DEPS -o test.o

exit 1

# build xetexdir/xetex-xetexextra.o
emcc -Dmain='__attribute__((visibility("default"))) busymain_xetex' -DHAVE_CONFIG_H -I. -I../../../texk/web2c -I./w2c  -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/texk -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texk -I../../../texk/web2c/xetexdir -DU_STATIC_IMPLEMENTATION -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/icu/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/freetype2/freetype2 -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/teckit/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/harfbuzz/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/graphite2/include -DGRAPHITE2_STATIC -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/libpng/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/zlib/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/pplib/include -I../../../texk/web2c/libmd5  -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng16 -I../../../texk/web2c/synctexdir -D__SyncTeX__ -DSYNCTEX_ENGINE_H=\"synctex-xetex.h\" -DBUILD_DATA_WITHOUT_ASSEMBLY=1 -I/mnt/c/Users/user/xetex2020.js/prefix-native/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/icu/include -I/mnt/c/Users/user/xetex2020.js/fontconfig-2.13.1 -Wimplicit -Wreturn-type -DBUILD_DATA_WITHOUT_ASSEMBLY=1 -I/mnt/c/Users/user/xetex2020.js/prefix-native/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/icu/include -I/mnt/c/Users/user/xetex2020.js/fontconfig-2.13.1 -MT xetexdir/xetex-xetexextra.o -MD -MP -MF xetexdir/.deps/xetex-xetexextra.Tpo -c -o xetexdir/xetex-xetexextra.o  $ROOT/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texk/web2c/xetexdir/xetexextra.c
/mnt/c/Users/user/emsdk/upstream/bin/llvm-objdump -t xetexdir/xetex-xetexextra.o | grep main

emar cru libxetex_.a xetexdir/libxetex_a-XeTeXFontInst.o xetexdir/libxetex_a-XeTeXFontMgr.o xetexdir/libxetex_a-XeTeXLayoutInterface.o xetexdir/libxetex_a-XeTeXOTMath.o xetexdir/libxetex_a-XeTeX_ext.o xetexdir/libxetex_a-XeTeX_pic.o xetexdir/libxetex_a-trans.o xetexdir/libxetex_a-hz.o xetexdir/libxetex_a-pdfimage.o   xetexdir/libxetex_a-XeTeXFontMgr_FC.o 
emranlib libxetex_.a
popd

pushd $TEXLIVE_BUILD_DIR/texk/dvipdfm-x
emcc -Dmain='__attribute__((visibility("default"))) busymain_dvipdfmx' -DHAVE_CONFIG_H -I. -I../../../texk/dvipdfm-x  -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/texk -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texk -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/libpng/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/zlib/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/libpaper/include -DBUILD_DATA_WITHOUT_ASSEMBLY=1 -I/mnt/c/Users/user/xetex2020.js/prefix-native/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/icu/include -I/mnt/c/Users/user/xetex2020.js/fontconfig-2.13.1 -Wimplicit -Wreturn-type -DBUILD_DATA_WITHOUT_ASSEMBLY=1 -I/mnt/c/Users/user/xetex2020.js/prefix-native/include -I/mnt/c/Users/user/xetex2020.js/texlive-source-9ed922e7d25e41b066f9e6c973581a4e61ac0328/texlive-build-native/libs/icu/include -I/mnt/c/Users/user/xetex2020.js/fontconfig-2.13.1 -MT dvipdfmx.o -MD -MP -MF $depbase.Tpo -c -o dvipdfmx.o ../../../texk/dvipdfm-x/dvipdfmx.c
/mnt/c/Users/user/emsdk/upstream/bin/llvm-objdump -t dvipdfmx.o | grep main
popd


O=$TEXLIVE_BUILD_DIR/texk/dvipdfm-x
DVIPDF_OBJECTS=" $O/agl.o  $O/cff.o $O/cff_dict.o $O/cid.o $O/cidtype0.o $O/cidtype2.o $O/cmap.o $O/cmap_read.o $O/cmap_write.o $O/cs_type2.o $O/dpxconf.o $O/dpxcrypt.o $O/dpxfile.o $O/dpxutil.o $O/dvi.o $O/dvipdfmx.o $O/epdf.o $O/error.o $O/fontmap.o $O/jp2image.o $O/jpegimage.o $O/bmpimage.o $O/mfileio.o $O/numbers.o $O/pngimage.o $O/mem.o $O/mpost.o $O/mt19937ar.o $O/otl_opt.o $O/pdfcolor.o $O/pdfdev.o $O/pdfdoc.o $O/pdfdraw.o $O/pdfencrypt.o $O/pdfencoding.o $O/pdffont.o $O/pdfnames.o $O/pdfobj.o $O/pdfparse.o $O/pdfresource.o $O/pdfximage.o $O/pkfont.o  $O/pst.o $O/pst_obj.o $O/sfnt.o $O/spc_color.o $O/spc_dvipdfmx.o $O/spc_dvips.o $O/spc_html.o $O/spc_misc.o $O/spc_pdfm.o $O/spc_tpic.o $O/spc_util.o $O/spc_xtx.o $O/specials.o $O/subfont.o $O/t1_char.o $O/t1_load.o $O/tfm.o $O/truetype.o $O/tt_aux.o $O/tt_cmap.o $O/tt_glyf.o $O/tt_gsub.o $O/tt_post.o $O/tt_table.o $O/type0.o $O/type1.o $O/type1c.o $O/unicode.o $O/vf.o $O/xbb.o"
DVIPDF_DEPS="-I$TEXLIVE_BUILD_DIR/libs/icu/include -I$ROOT/fontconfig-2.13.1 $TEXLIVE_BUILD_DIR/texk/kpathsea/.libs/libkpathsea.a $TEXLIVE_BUILD_DIR/libs/libpng/libpng.a $TEXLIVE_BUILD_DIR/libs/zlib/libz.a $TEXLIVE_BUILD_DIR/libs/libpaper/libpaper.a -lm" 

pushd $TEXLIVE_BUILD_DIR/texk/web2c
emcc -g -O2 -s ERROR_ON_UNDEFINED_SYMBOLS=0  -s FORCE_FILESYSTEM=1 -s LZ4=1 -s INVOKE_RUN=0 -s EXPORTED_FUNCTIONS='["_main"]' -s EXPORTED_RUNTIME_METHODS='["callMain","FS"]' -s TOTAL_MEMORY=536870912 -o $ROOT/busy.js $XETEX_OBJECTS $XETEX_DEPS $DVIPDF_DEPS $DVIPDF_OBJECTS $ROOT/main.c
popd
