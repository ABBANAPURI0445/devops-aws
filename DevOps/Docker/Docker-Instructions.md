## Docker Instructions
   1. FROM:  its base Image
   2. LABEL: meta data eg: "author"="John" 
   3. RUN: you can run any commands , run is execute while building the image
   4. ADD: download from remote or local  and deploy container
   5. COPY: copy from local and deploy into container
   6. EXPOSE: open port in container
   7. CMD: cmd is execute while runing the container , it  define container life time    eg: echo "helo" 
        ```
        FROM ubuntu
        CMD ["echo","hello"]
        ```
   8.  ENTRYPOINT
   9.  USER
   10.  WORKDIR
   11.  VOLUME
   12.  STOPSIGNAL
   13.  ARG
   14.  ENV

.net :  dll or exe
java: war , jar , ear
java -jar *.jar