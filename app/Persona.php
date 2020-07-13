<?php

namespace sisVentas;

use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    protected $table='persona';
    
    protected $primaryKey='idpersona';

    public $timestamps=false;

    protected $fillable =[
    	'tipo_persona',
    	'nombre',
    	'tipo_documento',
    	'num_documento',
    	'direccion',
    	'telefono',
    	'email'
    ];
    /*Se van a especificar cuando no queremos que se asignen al modelo */
    protected $guarded=[
    ];
}
