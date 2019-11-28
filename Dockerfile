FROM jodafons/gpu-base

USER root
SHELL [ "/bin/bash", "-c" ]
RUN apt update
RUN apt -y upgrade
RUN pip3 install jupyter
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.token = ''" >> "/root/.jupyter/jupyter_notebook_config.py"

RUN mkdir /jupyter_dir

COPY start_jupyter.sh /
RUN chmod 777 /start_jupyter.sh

ENTRYPOINT source /start_jupyter.sh