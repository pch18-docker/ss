json_port_pass=''
for aa in `env|grep '^P_[0-9]*=.*'`
do 
    port=${aa%=*}
    port=${port:2}
    pass=${aa#*=}
    json_port_pass="${json_port_pass},\"${port}\":\"${pass}\""
done
json_port_pass="{${json_port_pass:1}}"

echo "{
  \"port_password\":${json_port_pass},
  \"method\":\"${METHOD}\",
  \"fast_open\": true
}">/ss.json

/usr/bin/ssserver -c /ss.json start
