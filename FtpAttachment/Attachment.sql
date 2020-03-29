/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2020/2/26 20:49:06                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('tblSysAttachment') and o.name = 'FKAttachmentTypeAttachment')
alter table tblSysAttachment
   drop constraint FKAttachmentTypeAttachment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tblSysAttachment')
            and   type = 'U')
   drop table tblSysAttachment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('tblSysAttachmentType')
            and   type = 'U')
   drop table tblSysAttachmentType
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TblSysParameter')
            and   type = 'U')
   drop table TblSysParameter
go

/*==============================================================*/
/* Table: tblSysAttachment                                      */
/*==============================================================*/
create table tblSysAttachment (
   FAttachmentID        int                  identity(5,20),--ID,
   FAttachmentTypeID    int                  null                ,--ID2,
   FIndexID             int                  not null            ,--附件索引,
   FFolder              nvarchar(50)         null                ,--文件夹,
   FPath                nvarchar(80)         not null            ,--文件相对路径,
   FFileName            nvarchar(100)        not null            ,--文件名,
   FNote                nvarchar(50)         null                ,--备注,
   FCreateDate          smalldatetime        not null             default current_timestamp   ,--创建日期,
   constraint PK_tblSysAttachment primary key (FAttachmentID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('tblSysAttachment') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'tblSysAttachment' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '附件记录', 
   'user', @CurrentUser, 'table', 'tblSysAttachment'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FAttachmentID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FAttachmentID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID',
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FAttachmentID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FAttachmentTypeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FAttachmentTypeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID2',
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FAttachmentTypeID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIndexID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FIndexID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '附件索引',
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FIndexID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FFolder')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FFolder'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件夹',
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FFolder'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FPath')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FPath'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件相对路径',
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FPath'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FFileName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FFileName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件名',
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FFileName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FNote')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FNote'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FNote'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FCreateDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建日期',
   'user', @CurrentUser, 'table', 'tblSysAttachment', 'column', 'FCreateDate'
go

/*==============================================================*/
/* Table: tblSysAttachmentType                                  */
/*==============================================================*/
create table tblSysAttachmentType (
   FAttachmentTypeID    int                  identity,--ID,
   FAttachmentType      nvarchar(15)         not null            ,--附件类别,
   FTableName           nvarchar(50)         not null            ,--表名,
   FFolderColumn        nvarchar(50)         null                ,--文件夹字段,
   FIndexColumn         nvarchar(50)         not null            ,--FIndexColumn,
   FFolderPath          nvarchar(80)         not null            ,--文件夹路径,
   FCreateDate          smalldatetime        not null             default current_timestamp   ,--创建日期,
   constraint PK_tblSysAttachmentTYPE primary key (FAttachmentTypeID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('tblSysAttachmentType') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'tblSysAttachmentType' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '附件类别', 
   'user', @CurrentUser, 'table', 'tblSysAttachmentType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachmentType')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FAttachmentTypeID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FAttachmentTypeID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID',
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FAttachmentTypeID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachmentType')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FAttachmentType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FAttachmentType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '附件类别',
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FAttachmentType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachmentType')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FTableName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FTableName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '表名',
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FTableName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachmentType')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FFolderColumn')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FFolderColumn'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件夹字段',
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FFolderColumn'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachmentType')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FIndexColumn')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FIndexColumn'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'FIndexColumn',
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FIndexColumn'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachmentType')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FFolderPath')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FFolderPath'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件夹路径',
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FFolderPath'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('tblSysAttachmentType')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FCreateDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FCreateDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建日期',
   'user', @CurrentUser, 'table', 'tblSysAttachmentType', 'column', 'FCreateDate'
go

/*==============================================================*/
/* Table: TblSysParameter                                       */
/*==============================================================*/
create table TblSysParameter (
   FParameterID         int                  identity,--ID,
   FParameterName       nvarchar(50)         not null            ,--参数名称,
   FParameterValue      nvarchar(255)        null                ,--参数值,
   FNote                nvarchar(255)        null                ,--备注,
   constraint PK_TBLSYSPARAMETER primary key (FParameterID)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('TblSysParameter') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'TblSysParameter' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '系统参数表', 
   'user', @CurrentUser, 'table', 'TblSysParameter'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TblSysParameter')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FParameterID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TblSysParameter', 'column', 'FParameterID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID',
   'user', @CurrentUser, 'table', 'TblSysParameter', 'column', 'FParameterID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TblSysParameter')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FParameterName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TblSysParameter', 'column', 'FParameterName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数名称',
   'user', @CurrentUser, 'table', 'TblSysParameter', 'column', 'FParameterName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TblSysParameter')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FParameterValue')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TblSysParameter', 'column', 'FParameterValue'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数值',
   'user', @CurrentUser, 'table', 'TblSysParameter', 'column', 'FParameterValue'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('TblSysParameter')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FNote')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'TblSysParameter', 'column', 'FNote'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'TblSysParameter', 'column', 'FNote'
go

alter table tblSysAttachment
   add constraint FKAttachmentTypeAttachment foreign key (FAttachmentTypeID)
      references tblSysAttachmentType (FAttachmentTypeID)
go

