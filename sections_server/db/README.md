```sql
CREATE DATABASE sections_prod_db
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
CREATE USER sections_prod_user
  IDENTIFIED BY 'Aa123456!';
GRANT ALL PRIVILEGES
  ON sections_prod_db.*
  TO sections_prod_user;
```

