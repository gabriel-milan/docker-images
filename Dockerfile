FROM jodafons/gpu-base

USER root
SHELL [ "/bin/bash", "-c" ]
RUN apt update
RUN apt -y upgrade
RUN pip3 install jupyter
RUN pip3 install matplotlib
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.token = ''" >> "/root/.jupyter/jupyter_notebook_config.py"
RUN echo "c.NotebookApp.allow_remote_access = True " >> "/root/.jupyter/jupyter_notebook_config.py"
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> "/root/.jupyter/jupyter_notebook_config.py"
RUN echo "c.NotebookApp.local_hostnames = ['0.0.0.0']" >> "/root/.jupyter/jupyter_notebook_config.py"

RUN mkdir /jupyter_dir

COPY start_jupyter.sh /
RUN chmod 777 /start_jupyter.sh

EXPOSE 8888
EXPOSE 8889
EXPOSE 8890

ENTRYPOINT source /start_jupyter.sh