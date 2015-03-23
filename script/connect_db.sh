#!/bin/bash
# connect_db -- connect to the database specified in the variable in the first parameter

bin/dut_psql ${!1}
