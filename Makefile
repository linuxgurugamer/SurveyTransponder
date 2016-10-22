KSPDIR		:= ${HOME}/ksp/KSP_linux
MANAGED		:= ${KSPDIR}/KSP_Data/Managed
GAMEDATA	:= ${KSPDIR}/GameData
STGAMEDATA  := ${GAMEDATA}/SurveyTransponder
PLUGINDIR	:= ${STGAMEDATA}/Plugins
APIEXTDATA	:= ${PLUGINDIR}

RESGEN2	:= resgen2
GMCS	:= gmcs
GIT		:= git
TAR		:= tar
ZIP		:= zip

.PHONY: all clean info install release

SUBDIRS=Assets GameData Source

all clean install:
	@for dir in ${SUBDIRS}; do \
		make -C $$dir $@ || exit 1; \
	done

info:
	@echo "Survey Transponder Build Information"
	@echo "    resgen2:  ${RESGEN2}"
	@echo "    gmcs:     ${GMCS}"
	@echo "    git:      ${GIT}"
	@echo "    tar:      ${TAR}"
	@echo "    zip:      ${ZIP}"
	@echo "    KSP Data: ${KSPDIR}"
	@echo "    Plugin:   ${PLUGINDIR}"

release:
	tools/make-release
