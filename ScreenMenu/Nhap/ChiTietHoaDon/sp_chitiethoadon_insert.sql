﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)

	Update SANPHAM set SLTONKHO = SLTONKHO - @sl where MASP = @masp;
END
GO
Select count (*) from CHITIETHD
EXEC sp_chitiethoadon_insert 'HD01','SP30',90
Select count (*) from CHITIETHD