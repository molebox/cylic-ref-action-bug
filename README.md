

This is reproduction os a potential bug. We should be able to use both ref actions and sqlserver together, with ref actions fixing the cyclic relations.

I cant however run an initial migration after adding the ref actions to fix the cyclic relations.

1. Clone repo `git clone https://github.com/molebox/cylic-ref-action-bug.git`
1. Install deps `npm install`
1. Add your connection string. I used a local sql server database. See [connecting to your database](https://www.prisma.io/docs/concepts/components/preview-features/sql-server/sql-server-start-from-scratch-typescript#connect-your-database)
1. Run a migration `npx prisma migrate dev --name whatevs`
1. Check console for error message. The message displayed is one we would expect form sql server has we _not_ fixed the cyclic relations.

  ```terminal
  Error: P3018

  A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve    

  Migration name: 20210816094950_init

  Database error code: 1785

  Database error:
  Introducing FOREIGN KEY constraint 'FK__Chicken__chickenId' on table 'Chicken' may cause cycles or multiple cascade paths. Specify ON DELETE NO ACTION or ON UPDATE NO ACTION, or modify other FOREIGN KEY constraints.   
  ```