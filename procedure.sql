DELIMITER $$
CREATE PROCEDURE them_nhan_khau(IN id int, in cccd int, in ten varchar(45), in sdt int, in email varchar(60), in ngaysinh date, in dia_chi varchar(120), in trangthai varchar(45))
BEGIN
INSERT INTO `chung_cu_bluemoon`.`nhan_khau` (`ID`, `CCCD`, `TEN`, `SDT`, `EMAIL`, `NGAY_SINH`, `DIA_CHI`, `TRANG_THAI`) VALUES (id, cccd, ten, sdt, email, ngaysinh, dia_chi, trangthai);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE xem_danh_sach()
BEGIN
	select *
    from nhan_khau;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE them_ho_gd(in maho int, in phong int, in sotv int, in dientich int)
BEGIN
	INSERT INTO `chung_cu_bluemoon`.`ho_gd` (`MA_HO`, `PHONG`, `DIEN_TICH`) VALUES (maho, phong, sotv, dientich);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE them_chu_ho(in id int, in maho int)
BEGIN
	INSERT INTO `chung_cu_bluemoon`.`chu_ho` (`ID_CH`, `MA_HO`) VALUES (id, maho);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sua_chu_ho(in id int, in maho int)
BEGIN
	UPDATE `chung_cu_bluemoon`.`chu_ho` SET `ID_CH` = id WHERE (`MA_HO` = maho);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sua_nk(IN id int, in cccd int, in ten varchar(45), in sdt int, in email varchar(60), in ngaysinh date, in dia_chi varchar(120), in trangthai varchar(45))
BEGIN
	UPDATE `chung_cu_bluemoon`.`nhan_khau` SET `CCCD` = cccd WHERE (cccd <> NULL && `ID` = id);
    UPDATE `chung_cu_bluemoon`.`nhan_khau` SET `TEN` = ten WHERE (ten <> NULL && `ID` = id);
    UPDATE `chung_cu_bluemoon`.`nhan_khau` SET `SDT` = sdt WHERE (sdt <> NULL && `ID` = id);
    UPDATE `chung_cu_bluemoon`.`nhan_khau` SET `EMAIL` = email WHERE (email <> NULL && `ID` = id);
    UPDATE `chung_cu_bluemoon`.`nhan_khau` SET `NGAY_SINH` = ngaysinh WHERE (ngaysinh <> NULL && `ID` = id);
    UPDATE `chung_cu_bluemoon`.`nhan_khau` SET `DIA_CHI` = diachi WHERE (diachi <> NULL && `ID` = id);
    UPDATE `chung_cu_bluemoon`.`nhan_khau` SET `TRANG_THAI` = trangthai WHERE (trangthai <> NULL && `ID` = id);
    
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE xoa_chu_ho(in maho int)
BEGIN
	DELETE FROM `chung_cu_bluemoon`.`chu_ho` WHERE (`MA_HO` = maho);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE xoa_nk(in id int)
BEGIN
	DELETE FROM `chung_cu_bluemoon`.`nhan_khau` WHERE (`ID` = id);
END $$
DELIMITER ;

DELIMITER $$



CREATE PROCEDURE thong_ke_ho_gd(in tang int, in sotvmin int, in sotvmax int, in dtmin int, in dtmax int)
BEGIN
	SELECT *
    FROM ho_gd INNER JOIN chu_ho ON ho_gd.MA_HO = chu_ho.MA_HO
    WHERE (SO_TV >= sotvmin  OR (PHONG >= tang * 100 && PHONG <= tang * 100) OR (DIEN_TICH <=dtmax && DIEN_TICH >=dtmin));
END $$
DELIMITER ;

thong_ke_nkDELIMITER $$
CREATE PROCEDURE thong_ke_nk(in idmin int, in idmax int, in ttmin int,in ttmax int, in mqhmin int,in mqhmax int)
BEGIN
	SELECT *
    FROM nhan_khau join chu_ho on chu_ho.ID_CH = nhan_khau.ID_CHU_HO
    WHERE (idmin / 1000 <= PHONG && idmax/ 1000 >= PHONG && GIOI_TINH <= (idmax / 100)% 10 && GIOI_TINH >= (idmin / 100)% 10 && TRANG_THAI <= ttmin && TRANG_THAI >=ttmax,MQH >= mqhmin && MQH <= mqhmax);
END $$
DELIMITER ;


