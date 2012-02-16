SRC_DIR = source
BUILD_DIR = build
FOUNDRY_DIR = ../..
PRODUCTION_DIR = ${FOUNDRY_DIR}/scripts
DEVELOPMENT_DIR = ${FOUNDRY_DIR}/scripts_
UGLIFY = uglifyjs --unsafe -nc

BASE_FILES = ${SRC_DIR}/jquery.script.js

all: premake body min foundry

premake:
	mkdir -p ${BUILD_DIR}

body:
	@@cat ${BASE_FILES} > ${BUILD_DIR}/jquery.script.js

min:
	${UGLIFY} ${BUILD_DIR}/jquery.script.js > ${BUILD_DIR}/jquery.script.min.js

foundry:
	cat ${FOUNDRY_DIR}/build/foundry_intro.js \
		${BUILD_DIR}/jquery.script.js \
		${FOUNDRY_DIR}/build/foundry_outro.js \
		> ${DEVELOPMENT_DIR}/script.js

	${UGLIFY} ${DEVELOPMENT_DIR}/script.js > ${PRODUCTION_DIR}/script.js
