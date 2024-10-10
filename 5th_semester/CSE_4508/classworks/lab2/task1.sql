DECLARE
    ROWS_MANAGER   NUMBER := 0;
    ROWS_ASSISTANT NUMBER := 0;
BEGIN
    UPDATE EMPLOYEE
    SET
        SALARY = SALARY * 1.1
    WHERE
        DESIGNATION = 'manager'
        AND SALARY < 30000;
    ROWS_MANAGER := SQL%ROWCOUNT;
    UPDATE EMPLOYEE
    SET
        SALARY = SALARY * 0.9
    WHERE
        DESIGNATION = 'assistant manager'
        AND SALARY > 20000;
    ROWS_ASSISTANT := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Number of rows affected for managers: '
                         || ROWS_MANAGER);
    DBMS_OUTPUT.PUT_LINE('Number of rows affected for assistant managers: '
                         || ROWS_ASSISTANT);
END;