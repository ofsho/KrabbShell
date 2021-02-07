build:
    - compile src/main.c

shell:
    - mkdir build
    - mv a.out build/krabb
    - mkdir build/tests
    - ./src/dsc/dsc.krabb src/dsc/tests.dsc
;

build:
    - compile src/editor/main.c

shell:
    - mv a.out build/krabbeditor
;
