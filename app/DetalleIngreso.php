<?php

namespace sisVentas;

use Illuminate\Database\Eloquent\Model;

class DetalleIngreso extends Model
{
    protected $table='detalle_ingreso';
    
    protected $primaryKey='iddetalle_ingreso';

    public $timestamps=false;

    protected $fillable =[
    	'idingreso',
    	'idarticulo',
    	'cantidad',
    	'precio_compra',
    	'precio_venta'
    ];
    /*Se van a especificar cuando no queremos que se asignen al modelo */
    protected $guarded=[
    ];
}
