NFs = amf ausf chf nrf nssf pcf smf udm udr n3iwf upf udsf
PREFIX = towards5gs/free5gc
TAG = 3.4.0

all: $(NFs) webui

$(NFs):
	docker build -t $(PREFIX)-$@:$(TAG) --build-arg NF=$@ . --no-cache && ./load_to_kind.sh
dbpython:
	docker build -t $(PREFIX)-$@:$(TAG) -f ./free5gc-$@/Dockerfile ./free5gc-$@ --no-cache

webui:
	docker build -t $(PREFIX)-webui:$(TAG) -f ./free5gc-webui/Dockerfile .

clean:
	for NF in $(NFs); do \
		docker rmi $$(docker images | grep $(PREFIX)-$(NF) | awk '{print $1}') ; \
	done

