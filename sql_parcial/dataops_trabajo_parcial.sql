create database study_performance;
use study_performance;

IF NOT EXISTS (Select*from SYS.tables where object_id = OBJECT_ID(N'dbo.study')AND type = 'u')
	Create table dbo.study(
		gender varchar(20),
		race_ethnicity varchar(200),	
		parental_level_of_education	varchar(200),
		lunch varchar(20),
		test_preparation_course varchar(200),		
		math_score varchar(20),
		reading_score varchar(20),
		writing_score varchar(20),
	)
GO

/*Importar la data de mi archivo csv study_performance*/
Bulk insert dbo.study
from 'C:\Users\21130\DataOps\Trabajo_Parcial\python_parcial\dataset_parcial\study_performance.csv' /*Ubicacion de mi archivo*/
with
(
	firstrow = 2, 
	fieldterminator =',', 
	rowterminator = '0x0a'
)
GO

select*from dbo.study