CREATE OR REPLACE PRIMES(NUMBER INT, ISPRIME INT);

CREATE FUNCTION PRIME_GENERATOR (
    N INT
) RETURN PRIMES
BEGIN
    DECLARE
        I      INT := 2;
        WHILE  I <= N LOOP
            INSERT INTO PRIMES VALUES(
                I,
                1
            ) I := I + 1;
        END LOOP;

        I      := 2;
        WHILE  I<=SQRT(N) LOOP
            IF (
                SELECT
                    ISPRIME
                FROM
                    PRIMES
                WHERE
                    NUMBER = I
            )= 1 THEN
                DECLARE
                    J      INT := I*I;
                    WHILE  J <= N LOOP
                        IF J MOD I = 0 THEN
                            UPDATE PRIMES
                            SET
                                ISPRIME = 0
                            WHERE
                                NUMBER = J;
                        END IF;

                        J := J + I;
                    END LOOP;
                END IF;
                I := I + 1;
            END LOOP;
        END;
    RETURN (
        SELECT
            NUMBER
        FROM
            PRIMES
    );
END;