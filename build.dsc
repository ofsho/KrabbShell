build:
    - compile src/main.c

shell:
    - mkdir build
    - mv a.out build/krabb
;

build:
    - compile src/editor/main.c

shell:
    - mv a.out build/krabbeditor
;
