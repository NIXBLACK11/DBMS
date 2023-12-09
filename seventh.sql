-- String Functions:
SELECT UPPER('gehu') FROM dual; -- GEHU
SELECT LOWER('GEHU') FROM dual; -- gehu
SELECT INITCAP('hello world') FROM dual; -- Hello World
SELECT LTRIM(' hai') FROM dual; -- hai
SELECT RTRIM('hai ') FROM dual; -- hai
SELECT RTRIM(' hai ') FROM dual; --  hai
SELECT CONCAT('GEHU', ' university') FROM dual; -- GEHU university
SELECT LENGTH('GEHU') FROM dual; -- 4
SELECT REPLACE('GEHU university', 'GEHU', 'GEU') FROM dual; -- GEU university
SELECT SUBSTR('UNIVERSITY', 4, 6) FROM dual; -- VERSIT
SELECT RPAD('GEHU', 10, '*') FROM dual; -- GEHU******
SELECT LPAD('GEHU', 10, '*') FROM dual; -- ******GEHU
SELECT INSTR('COCOON', 'O') FROM dual; -- 1
SELECT REPLACE('Dany', 'y', 'ie') FROM dual; -- Danie
SELECT TRANSLATE('cold', 'ld', 'ol') FROM dual; -- cool
SELECT SYSDATE FROM dual; -- Current date and time
SELECT ROUND(SYSDATE) FROM dual; -- Rounded date and time
SELECT ADD_MONTHS(SYSDATE, 3) FROM dual; -- Current date + 3 months
SELECT LAST_DAY(SYSDATE) FROM dual; -- Last day of the current month
SELECT SYSDATE + 20 FROM dual; -- Current date + 20 days
SELECT NEXT_DAY(SYSDATE, 'tuesday') FROM dual; -- Next Tuesday from the current date

-- Numeric Functions:
SELECT ROUND(15.6789) FROM dual; -- 16
SELECT CEIL(23.20) FROM dual; -- 24
SELECT FLOOR(34.56) FROM dual; -- 34
SELECT TRUNC(15.56743) FROM dual; -- 15
SELECT SIGN(-345) FROM dual; -- -1
SELECT ABS(-70) FROM dual; -- 70

-- Math Functions:
SELECT ABS(45) FROM dual; -- 45
SELECT POWER(10, 12) FROM dual; -- 1000000000000
SELECT MOD(11, 5) FROM dual; -- 1
SELECT EXP(10) FROM dual; -- 22026.4657948067
SELECT SQRT(225) FROM dual; -- 15
