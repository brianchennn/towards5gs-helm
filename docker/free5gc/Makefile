NFs = amf ausf chf nrf nssf pcf smf udm udr n3iwf upf chf udsf
PREFIX = towards5gs/free5gc
TAG = 3.4.0

base:
	docker build -t $(PREFIX)-base:$(TAG) ./free5gc-base --no-cache

nfs:
	for NF in $(NFs) ; do \
		docker build -t $(PREFIX)-$$NF:$(TAG) ./free5gc-$$NF --no-cache ; \
	done

amf:
	docker build -t $(PREFIX)-amf:$(TAG) ./free5gc-amf --no-cache ; \

udsf:
	docker build -t $(PREFIX)-udsf:$(TAG) ./free5gc-udsf --no-cache ; \

webui:
	docker build -t $(PREFIX)-webui:$(TAG) ./free5gc-webui

clean:
	docker rmi $$(docker images | grep $(PREFIX) | awk '{print $3}')

