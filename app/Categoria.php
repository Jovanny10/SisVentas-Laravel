<?php

namespace sisVentas;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    protected $table='categoria';
    
    protected $primaryKey='idcategoria';

    public $timestamps=false;

    protected $fillable =[
    	'nombre',
    	'descripcion',
    	'condicion'
    ];
    /*Se van a especificar cuando no queremos que se asignen al modelo */
    protected $guarded=[
    ];

}
