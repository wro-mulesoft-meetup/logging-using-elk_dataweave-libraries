# Externalize logs in mulesoft

---

## Requirements

* Docker :whale:
* docker-compose :whale2:
* AnypointStudio :computer:
* java 11 :coffee:

### Useful links:

* [Elastic stack docker compose](https://github.com/deviantony/docker-elk) 
* [Log4j documetation](https://logging.apache.org/log4j/2.x/manual/layouts.html#JSONLayout)

---

## Step by step:

1. Run docker compose script on elastic stack containers
2. Update logstash pipeline using [provided configuration file](scripts%2Flogstash-pipeline.conf)
3. Restart the stack
4. Run apps - as a stack
   * [departure-sapi](departure-sapi)
   * [mi6-mission-sapi](mi6-mission-sapi)
   * [mule-meetup-logging-papi](mule-meetup-logging-papi)
5. Observe the logs being sent to the elastic stack.
6. Improvise, adapt, overcome! :rocket:

---

#### Additional links:

* [Grok documentation - format your input logs.](https://www.elastic.co/guide/en/elasticsearch/reference/current/grok.html)
* [Logstash plugins - need some additional tools?](https://www.elastic.co/guide/en/logstash/current/input-plugins.html)
* [JsonTemplate - better personalization of the logger layout.](https://logging.apache.org/log4j/2.x/manual/json-template-layout.html)
* [Json-logger - an abandoned MuleSoft plugin. Fork it to make it work!](https://github.com/mulesoft-consulting/json-logger)
* [Old how-to from MuleSoft](https://blogs.mulesoft.com/dev-guides/how-to-tutorials/json-logging-mule-4/)

---
#### find me @
* [linkedin](https://www.linkedin.com/in/leszek-gersztyn-a97240156/)
* [gitHub](https://github.com/LeszekGersztyn)