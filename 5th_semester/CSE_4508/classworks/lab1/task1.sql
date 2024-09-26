DECLARE
    V_YEAR INTEGER := 2019;
    V2     INTEGER;
BEGIN
    IF V_YEAR MOD 10 = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Yes, '
                             || V_YEAR
                             || 's');
    ELSE
        V2 := FLOOR(V_YEAR / 10);
        DBMS_OUTPUT.PUT_LINE('No, '
                             || V2*10
                             || 's');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: '
                             || SQLERRM);
END;
/