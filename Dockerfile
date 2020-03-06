FROM debian
COPY ./lab1vmi.sh /home/lab.sh
RUN touch /home/file1
RUN touch /home/file2
RUN echo "My first dockerfile" > /home/file1
ENTRYPOINT /home/lab.sh
