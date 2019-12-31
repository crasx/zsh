#!/bin/bash

f(){
  echo "ubuntustart"
}

ubuntustart(){
  service apache2 start
  service mysql start
  service webmin start
}
