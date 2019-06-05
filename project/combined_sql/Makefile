combine: createTables.sql dataLoad.sql createFunc.sql createTrig.sql createView.sql
	cat ./createTables.sql ./createView.sql ./createTrig.sql ./dataLoad.sql ./createFunc.sql ../source_sql/select.sql > ./combined.sql
	cat ./createTables.sql ./createView.sql ./dataLoad.sql ../source_sql/select.sql > ./test.sql

createTables.sql:
	cp ../source_sql/tables.sql ./createTables.sql

dataLoad.sql:
	cat ../source_sql/insert.sql ../source_sql/update.sql ../source_sql/delete.sql > ./dataLoad.sql

createFunc.sql:
	cat ../source_sql/funcs.sql ../source_sql/funcs_tests.sql > ./createFunc.sql

createTrig.sql:
	cp ../source_sql/triggers.sql ./createTrig.sql

createView.sql:
	cp ../source_sql/viewes.sql ./createView.sql

clean:
	rm ./*.sql


