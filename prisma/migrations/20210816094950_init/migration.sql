BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Chicken] (
    [id] INT NOT NULL IDENTITY(1,1),
    [chickenId] INT,
    CONSTRAINT [PK__Chicken__id] PRIMARY KEY ([id]),
    CONSTRAINT [Chicken_chickenId_unique] UNIQUE ([chickenId])
);

-- AddForeignKey
ALTER TABLE [dbo].[Chicken] ADD CONSTRAINT [FK__Chicken__chickenId] FOREIGN KEY ([chickenId]) REFERENCES [dbo].[Chicken]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN 
    ROLLBACK TRAN;
END;
THROW

END CATCH
