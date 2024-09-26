CREATE OR REPLACE FUNCTION PRIME_GENERATOR12(
    S IN NUMBER
) RETURN VARCHAR2 IS
    SUM_OF_PRIMES  NUMBER := 0;
    CURRENT_NUMBER NUMBER := 2;
    RESULT         VARCHAR2(4000) := '';

    FUNCTION IS_PRIME(
        N IN NUMBER
    ) RETURN BOOLEAN IS
        I NUMBER;
    BEGIN
        IF N < 2 THEN
            RETURN FALSE;
        END IF;

        FOR I IN 2..FLOOR(SQRT(N)) LOOP
            IF N MOD I = 0 THEN
                RETURN FALSE;
            END IF;
        END LOOP;

        RETURN TRUE;
    END IS_PRIME;
BEGIN
    WHILE SUM_OF_PRIMES + CURRENT_NUMBER <= S LOOP
        IF IS_PRIME(CURRENT_NUMBER) THEN
            SUM_OF_PRIMES := SUM_OF_PRIMES + CURRENT_NUMBER;
            IF RESULT IS NOT NULL THEN
                RESULT := RESULT
                          || ', ';
            END IF;

            RESULT := RESULT
                      || CURRENT_NUMBER;
        END IF;

        CURRENT_NUMBER := CURRENT_NUMBER + 1;
    END LOOP;

    RETURN RESULT;
END PRIME_GENERATOR12;
/

DECLARE
    S      NUMBER := 20;
    PRIMES VARCHAR2(4000);
BEGIN
    PRIMES := PRIME_GENERATOR12(S);
    DBMS_OUTPUT.PUT_LINE('Generated prime numbers: '
                         || PRIMES);
END;
/