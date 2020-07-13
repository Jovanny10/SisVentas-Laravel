<?php

namespace sisVentas;

use Illuminate\Database\Eloquent\Model;

class Ingreso extends Model
{
    protected $table='ingreso';
    
    protected $primaryKey='idingreso';

    public $timestamps=false;

    protected $fillable =[
    	'idproveedor',
    	'tipo_comprobante',
    	'serie_comprobante',
    	'num_comprobante',
    	'fecha_hora',
    	'impuesto',
    	'estado'
    ];
    /*Se van a especificar cuando no queremos que se asignen al modelo */
    protected $guarded=[
    ];
}
