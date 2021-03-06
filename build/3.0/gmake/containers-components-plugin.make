# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug)
  OBJDIR     = obj/Debug/containers-components-plugin
  TARGETDIR  = ../../../output/lib/wxformbuilder
  TARGET     = $(TARGETDIR)/libcontainers-30.so
  DEFINES   += -DUNICODE -D_UNICODE -DDEBUG -D_DEBUG -DBUILD_DLL -DTIXML_USE_TICPP -D__WXDEBUG__ -DWXUSINGDLL
  INCLUDES  += -I../../../sdk/tinyxml -I../../../sdk/plugin_interface
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -Wall -fPIC -O0 `wx-config --debug=yes --static=no --unicode=yes --cxxflags`
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -shared `wx-config --debug=yes --static=no --unicode=yes --libs ` -L../../../sdk/lib
  LIBS      += -lwx_gtk2ud_plugin-interface-3.0 -lticppd
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../../sdk/lib/libwx_gtk2ud_plugin-interface-3.0.a ../../../sdk/lib/libticppd.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = obj/Release/containers-components-plugin
  TARGETDIR  = ../../../output/lib/wxformbuilder
  TARGET     = $(TARGETDIR)/libcontainers.so
  DEFINES   += -DUNICODE -D_UNICODE -DNDEBUG -DBUILD_DLL -DTIXML_USE_TICPP -DWXUSINGDLL
  INCLUDES  += -I../../../sdk/tinyxml -I../../../sdk/plugin_interface
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -Wall -O2 -fPIC -fno-strict-aliasing `wx-config --static=no --unicode=yes --cxxflags`
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -shared `wx-config --static=no --unicode=yes --libs ` -L../../../sdk/lib
  LIBS      += -lwx_gtk2u_plugin-interface-3.0 -lticpp
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../../sdk/lib/libwx_gtk2u_plugin-interface-3.0.a ../../../sdk/lib/libticpp.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/containers.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking containers-components-plugin
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning containers-components-plugin
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/containers.o: ../../../plugins/containers/containers.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
