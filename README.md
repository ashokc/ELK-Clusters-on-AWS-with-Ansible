# ELK Clusters on AWS with Ansible

This is the source code to along with the blog article [ELK Clusters on AWS with Ansible](http://xplordat.com/2017/12/12/elk-stack-with-vagrant-and-ansible/)

* Make sure to supply your own aws api credentials in "aws-secrets.yml" and perhaps encrypt as well
* Add the BOTO module to your Python install (sudo pip install boto)
* Download [ec2.py](https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py) and [ec2.ini](https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini) that you will need to generate dynamic inventories

Uses the following roles:

* [elastic.elasticsearch](https://galaxy.ansible.com/elastic/elasticsearch/) for Elasticsearch
* [ashokc.logstash](https://galaxy.ansible.com/ashokc/logstash/) for Logstash
* [ashokc.kibana](https://galaxy.ansible.com/ashokc/kibana/) for Kibana
* [ashokc.filebeat](https://galaxy.ansible.com/ashokc/filebeat/) for Filebeat

## Usage

Provision the ELK Cluster hardware with:

```
./provisionHardware.sh
```
Provision the ELK software with:

```
./provisionSoftware.sh
```

### For testing:

1. Generate logs on a filebeat host. Replace xxx.xxx.xxx.xxx below with the actual IP address of this host

```
scp -i ~/.ssh/ELK_KEY_PAIR.pem ./genLogs.pl ubuntu@xxx.xxx.xxx.xxx:/home/ubuntu/genLogs.pl
ssh -i ~/.ssh/ELK_KEY_PAIR.pem xxx.xxx.xxx.xxx -l ubuntu
./genLogs.pl
````

2. Open a browswer to Kibana and explore. Replace yyy.yyy.yyy.yyy with the actual IP address for the Kibana host

```
http://yyy.yyy.yyy.yyy:5601


