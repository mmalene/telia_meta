#ARG https_proxy=http://proxy.telia.dk:8080/
#ARG http_proxy=http://proxy.telia.dk:8080/


FROM jupyter/datascience-notebook

#ENV http_proxy=http://proxy.telia.dk:8080/
#ENV https_proxy=http://proxy.telia.dk:8080/


COPY requirements.txt ./
RUN pip install -U pip
RUN pip install --no-cache-dir -r requirements.txt

ENV JUPYTER_ENABLE_LAB=yes

COPY --chown=${NB_UID}:${NB_GID} . /home/jovyan/work
WORKDIR /home/jovyan/work

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--notebook-dir=/home/jovyan/work", "--allow-root"]