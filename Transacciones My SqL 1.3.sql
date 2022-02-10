set @v_id_subscriptor = 0;
set @v_cod_subsc = '202212345';
set @v_nomb = 'Jon Paul';
set @v_apell= 'Doe';

select * from bd_sample.tbl_productos;
select * from bd_sample.tbl_items_factura;
select * from bd_sample.tbl_subscriptores;
select * from bd_sample.tbl_facturas;


insert into bd_sample.tbl_subscriptores(
id_subscriptor, codigo_subscriptor, nombres, apellidos
) values (@v_id_subscriptor, @v_cod_subsc, @v_nomb, @v_apell);

select * from bd_sample.tbl_subscriptores;

delete from bd_sample.tbl_facturas
where id_factura = 29;


/*EJEC 1*/
set @v_id_ft = 0;
set @v_fecha_emi = '2022-05-15 11:25:25';
set @v_id_subsc= 16;
set @v_num_items = 1;
set @v_precio_vt = 5.50;
set @v_subtota = @v_precio_vt * @v_num_items;
set @v_isv_tota = (@v_subtota * 0.18);
set @v_totapagar = @v_subtota + @v_isv_tota;
set @v_id_prot = 2;
set @v_cant = 2;

/*EJEC 2*/
set @v_id_ft = 0;
set @v_fecha_emi = '2022-05-15 11:25:25';
set @v_id_subsc= 16;
set @v_num_items = 1;
set @v_precio_vt = 9.50;
set @v_subtota = @v_precio_vt * @v_num_items;
set @v_isv_tota = (@v_subtota * 0.18);
set @v_totapagar = @v_subtota + @v_isv_tota;
set @v_id_prot = 3;
set @v_cant = 2;



insert into bd_sample.tbl_facturas
values( @v_id_ft,
@v_fecha_emi,
 @v_id_subsc,
@v_num_items,
 @v_isv_tota,
@v_subtota,
@v_totapagar
);

 set @v_id_factura = (select last_insert_id());
 
 insert into bd_sample.tbl_items_factura values
 (
 @v_id_ft,
 @v_id_prot,
 @v_cant
 );
 
 select sum(totapagar) Monto_Total  from bd_sample.tbl_facturas
where id_subscriptor = 16;