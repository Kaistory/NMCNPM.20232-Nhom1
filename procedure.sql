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

DELIMITER $$
CREATE PROCEDURE tim_ho_nk(in id int)
BEGIN
	select *
    from nhan_khau
    where(ID = id);
END $$
DELIMITER ;

CREATE PROCEDURE thong_ke_ho_gd(in tang int, in sotvmin int, in sotvmax int, in dtmin int, in dtmax int)
BEGIN
	SELECT *
    FROM ho_gd INNER JOIN chu_ho ON ho_gd.MA_HO = chu_ho.MA_HO
    WHERE (SO_TV >= sotvmin  OR (PHONG >= tang * 100 && PHONG <= tang * 100) OR (DIEN_TICH <=dtmax && DIEN_TICH >=dtmin));
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE thong_ke_nk(in idmin int, in idmax int, in ttmin int,in ttmax int, in mqhmin int,in mqhmax int)
BEGIN
	SELECT *
    FROM nhan_khau join chu_ho on chu_ho.ID_CH = nhan_khau.ID_CHU_HO
    WHERE (idmin / 1000 <= PHONG && idmax/ 1000 >= PHONG && GIOI_TINH <= (idmax / 100)% 10 && GIOI_TINH >= (idmin / 100)% 10 && TRANG_THAI <= ttmin && TRANG_THAI >=ttmax,MQH >= mqhmin && MQH <= mqhmax);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE them_kt(in makt int, in loaikt varchar(45),in tenkt varchar(45), in sotien int, in donvi varchar(45))
BEGIN
	INSERT INTO `chung_cu_bluemoon`.`ho_gd` (`MA_KT`, `LOAI_KT`, `TEN_KT`,`SO_TIEN`, `DON_VI`) VALUES (makt, loaikt, tenkt, sotien, donvi);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE xem_ds_kt()
BEGIN
	select *
    from khoan_thu;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE xoa_kt(in makt int)
BEGIN
	DELETE FROM `chung_cu_bluemoon`.`khoan_thu` WHERE (`MA_KT` = makt);
END $$
DELIMITER ;

DELIMITER $$

DELIMITER $$
CREATE PROCEDURE sua_kt(in makt int, in loaikt varchar(45),in tenkt varchar(45), in sotien int, in donvi varchar(45))
BEGIN
	UPDATE `chung_cu_bluemoon`.`khoan_thu` SET `LOAI_KT` = loaikt WHERE (loaikt <> NULL && `MA_KT` = makt);
    UPDATE `chung_cu_bluemoon`.`khoan_thu` SET `TEN_KT` = tenlt WHERE (tenkt <> NULL && `MA_KT` = makt);
    UPDATE `chung_cu_bluemoon`.`khoan_thu` SET `SO_TIEN` = sotien WHERE (sotien <> NULL && `MA_KT` = makt);
    UPDATE `chung_cu_bluemoon`.`khoan_thu` SET `DON_VI` = loaikt WHERE (donvi <> NULL && `MA_KT` = makt);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE tim_ho_kt(in makt int)
BEGIN
	select *
    from khoan_thu
    where(MA_KT = makt);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE thong_ke_kt(in loaimin int, in loaimax int, in tienmin int,in tienmax int)
BEGIN
	SELECT *
    FROM khoan_thu
    WHERE (LOAI_KT <= loaimax and LOAI_KT >= loaimin and tienmin <= SO_TIEN and tienmax >= SO_TIEN);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE xem_ds_khoan_nop(in maho int)
BEGIN
	select khoan_thu.TEN_KT, khoan_thu.SO_TIEN
    from khoan_thu
    where(MA_HO = maho)
    UNION
    select cong_ty_cc.TEN_KT, cong_ty_cc.SO_TIEN
    from cong_ty_cc
    where(MA_HO = maho);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE them_nguoi_nop(in maho int, in sotien int, in thoigian date)
BEGIN
	INSERT INTO `chung_cu_bluemoon`.`cac_khoan_nop` (`MA_HO`,`SO_TIEN`, `THOI_GIAN`) VALUES (maho, sotien, thoigian);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sua_nguoi_nop(in maho int, in sotien int, in thoigian date)
BEGIN
	UPDATE `chung_cu_bluemoon`.`cac_khoan_nop` SET `SO_TIEN` = sotien WHERE (sotien <> NULL && `MA_HO` = makt);
    UPDATE `chung_cu_bluemoon`.`cac_khoan_nop` SET `THOI_GIAN` = thoigian WHERE (thoigian <> NULL && `MA_HO` = makt);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE tim_tt_tien_nop(in maho int)
BEGIN
	select *
    from cac_khoan_nop
    where(ID = id);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE tim_tien_nop_ho(in maho int)
BEGIN
	select khoan_thu.TEN_KT, khoan_thu.SO_TIEN
    from khoan_thu
    where(MA_HO = maho)
    UNION
    select cong_ty_cc.TEN_KT, cong_ty_cc.SO_TIEN
    from cong_ty_cc
    where(MA_HO = maho);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE xoa_khoan_thu_gd(in maho int)
BEGIN
	DELETE FROM `chung_cu_bluemoon`.`cac_khoan_nop` WHERE (`MA_HO` = maho);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE thong_ke_thu_tien(in trangthai varchar(45))
BEGIN
	SELECT *
    FROM cac_khoan_nop
    WHERE (TRANG_THAI = trangthai);
END $$
DELIMITER ;
