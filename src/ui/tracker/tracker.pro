QT += opengl
HEADERS += clip.h  calibration.h        tracker.h  zoom.h  scene.h  main.h ../../libmv/tracking/sad.h
SOURCES += clip.cc calibration.cc gl.cc tracker.cc zoom.cc scene.cc main.cc ../../libmv/tracking/sad.cc
OTHER_FILES += shader.glsl
RESOURCES = tracker.qrc
INCLUDEPATH += ../.. ../../third_party/glog/src
INCLUDEPATH += /usr/include/eigen3/
#LIBS += -L../../../bin-dbg/lib/ -lsimple_pipeline_d -limage_d -ltracking_d -lmultiview_d -lglog
#-ltracking -limage
LIBS += -L../../../bin-opt/lib/ -lsimple_pipeline -lmultiview
QMAKE_CXXFLAGS_RELEASE += -Ofast -march=native

win32:CONFIG+=glew
glew {
 DEFINES += GLEW
 win32 {
  HEADERS += GL/glew.h GL/wglew.h
  SOURCES += glew.c
  DEFINES += GLEW_STATIC
 }
 unix {
  LIBS += -lGLEW
 }
}

exists(/usr/include/libavcodec/avcodec.h):CONFIG+=ffmpeg
ffmpeg {
 DEFINES += USE_FFMPEG
 LIBS += -lavcodec -lavformat
}

OBJECTS_DIR=build
MOC_DIR=build
RCC_DIR=build
DESTDIR=build

OTHER_FILES += CMakeLists.txt ../../libmv/simple_pipeline/CMakeLists.txt
OTHER_FILES += ../../libmv/image/image_pyramid.cc ../../libmv/image/image_pyramid.h
OTHER_FILES += ../../libmv/image/convolve.cc ../../libmv/image/convolve.h
OTHER_FILES += ../../libmv/simple_pipeline/*.h ../../libmv/simple_pipeline/*.cc
OTHER_FILES += ../../libmv/tracking/klt.h ../../libmv/tracking/klt.cc
OTHER_FILES += ../../libmv/multiview/fundamental.cc ../../libmv/multiview/projection.cc
