- hosts: 'localhost'
  connection: local
  gather_facts: no
  tasks:

    - name: Set fact
      set_fact:
        url_prefix: "http://nexus3.mpo:8081/service/rest/v1/search?repository=misc_artifacts&"
        url_query: "q=jdks/jdk8u162-b12_openj9-0.8.0/OpenJDK8-OPENJ9_ppc64le_Linux_jdk8u162-b12_openj9-0.8.0.tar.gz"

    - name: Download api
      uri:
        url: "{{ url_prefix }}/{{ url_query }} | urlencode"
        method: GET
        user: admin
        password: admin123
        body_format: json
        force_basic_auth: yes
      register: response

    - name: Get response
      debug: var=response.msg
    