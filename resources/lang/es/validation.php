<? php

volver [

    / *
    | ------------------------------------------------- -------------------------
    El | Líneas de lenguaje de validación
    | ------------------------------------------------- -------------------------
    El |
    El | Las siguientes líneas de idioma contienen los mensajes de error predeterminados utilizados por
    El | La clase de validador. Algunas de estas reglas tienen múltiples versiones como
    El | Como las reglas de tamaño. Siéntase libre de modificar cada uno de estos mensajes aquí.
    El |
    * /

    ' accept '              => 'El campo: atributo debe ser aceptado.' ,
    'active_url'            => 'El campo: atributo no es una URL válida.' ,
    'after'                 => 'El campo: atributo debe ser una fecha posterior a: fecha'. ,
    'after_or_equal'        => 'El campo: atributo debe ser una fecha posterior o igual a: fecha'. ,
    'alpha'                 => 'El campo: atributo solo puede contener letras.' ,
    'alpha_dash'            => 'El campo: atributo solo puede contener letras, números, guiones y guiones bajos.' ,
    'alpha_num'             => 'El campo: atributo solo puede contener letras y números.' ,
    'array'                 => 'El campo: atributo debe ser un array.' ,
    'before'                => 'El campo: atributo debe ser una fecha anterior a: fecha'. ,
    'before_or_equal'       => 'El campo: atributo debe ser una fecha anterior o igual a: fecha'. ,
    'entre'               => [
        'numeric' => 'El campo: atributo debe ser un valor entre: min y: max.' ,
        'file'     => 'El archivo: atributo debe pesar entre: min y: max kilobytes'. ,
        'string'   => 'El campo: atributo debe contener entre: min y: max caracteres.' ,
        'array'    => 'El campo: atributo debe contener entre: min y: max elementos.' ,
    ],
    'boolean'               => 'El campo: atributo debe ser verdadero o falso.' ,
    'confirmado'             => 'El campo confirmación de: atributo no coincide'. ,
    'date'                  => 'El campo: atributo no corresponde con una fecha válida.' ,
    'date_equals'           => 'El campo: atributo debe ser una fecha igual a: fecha'. ,
    'date_format'           => 'El campo: atributo no corresponde con el formato de fecha: formato.' ,
    'different'             => 'Los campos: atributo y: otros deben ser diferentes.' ,
    'digits'                => 'El campo: atributo debe ser un número de: dígitos dígitos.' ,
    'digits_between'        => 'El campo: atributo debe contener entre: min y: max dígitos.' ,
    'dimensiones'            => 'El campo: atributo tiene dimensiones de imagen inválidas.' ,
    'distinct'              => 'El campo: atributo tiene un valor duplicado'. ,
    'email'                 => 'El campo: atributo debe ser una dirección de correo válida.' ,
    'ends_with'             => 'El campo: atributo debe finalizar con algunos de los siguientes valores:: valores' ,
    'exist'                => 'El campo: atributo seleccionado no existe.' ,
    'file'                  => 'El campo: atributo debe ser un archivo.' ,
    'filled'                => 'El campo: atributo debe tener un valor.' ,
    'gt'                    => [
        'numeric' => 'El campo: atributo debe ser mayor a: valor'. ,
        'file'     => 'El archivo: atributo debe pesar más de: valor kilobytes'. ,
        'string'   => 'El campo: atributo debe contener más de: valor caracteres.' ,
        'array'    => 'El campo: atributo debe contener más de: valor elementos.' ,
    ],
    'gte'                   => [
        'numeric' => 'El campo: atributo debe ser mayor o igual a: valor'. ,
        'file'     => 'El archivo: atributo debe pesar: valor o más kilobytes'. ,
        'string'   => 'El campo: atributo debe contener: valor o más caracteres.' ,
        'array'    => 'El campo: atributo debe contener: valor o más elementos.' ,
    ],
    'image'                 => 'El campo: atributo debe ser una imagen.' ,
    'in'                    => 'El campo: atributo es inválido.' ,
    'in_array'              => 'El campo: atributo no existe en: otro.' ,
    'integer'               => 'El campo: atributo debe ser un número entero.' ,
    'ip'                    => 'El campo: atributo debe ser una dirección IP válida.' ,
    'ipv4'                  => 'El campo: atributo debe ser una dirección IPv4 válida.' ,
    'ipv6'                  => 'El campo: atributo debe ser una dirección IPv6 válida.' ,
    'json'                  => 'El campo: atributo debe ser una cadena de texto JSON válida.' ,
    'lt'                    => [
        'numeric' => 'El campo: atributo debe ser menor a: valor'. ,
        'file'     => 'El archivo: atributo debe pesar menos de: valor kilobytes'. ,
        'string'   => 'El campo: atributo debe contener menos de: valor caracteres.' ,
        'array'    => 'El campo: atributo debe contener menos de: valor elementos.' ,
    ],
    'lte'                   => [
        'numeric' => 'El campo: atributo debe ser menor o igual a: valor'. ,
        'file'     => 'El archivo: atributo debe pesar: valor o menos kilobytes'. ,
        'string'   => 'El campo: atributo debe contener: valor o menos caracteres.' ,
        'array'    => 'El campo: atributo debe contener: valor o menos elementos.' ,
    ],
    'max'                   => [
        'numeric' => 'El campo: atributo no debe ser mayor a: max.' ,
        'file'     => 'El archivo: atributo no debe pesar más de: max kilobytes'. ,
        'string'   => 'El campo: atributo no debe contener más de: max caracteres.' ,
        'array'    => 'El campo: atributo no debe contener más de: max elementos.' ,
    ],
    'mimes'                 => 'El campo: atributo debe ser un archivo de tipo:: valores'. ,
    'mimetypes'             => 'El campo: atributo debe ser un archivo de tipo:: valores'. ,
    'min'                   => [
        'numeric' => 'El campo: atributo debe ser al menos: min.' ,
        'file'     => 'El archivo: atributo debe pesar al menos: min kilobytes'. ,
        'string'   => 'El campo: atributo debe contener al menos: min caracteres.' ,
        'array'    => 'El campo: atributo debe contener al menos: min elementos.' ,
    ],
    'not_in'                => 'El campo: atributo seleccionado es inválido.' ,
    'not_regex'             => 'El formato del campo: atributo es inválido'. ,
    'numeric'               => 'El campo: atributo debe ser un número.' ,
    'password'              => 'La contraseña es incorrecta.' ,
    'present'               => 'El campo: atributo debe estar presente.' ,
    'regex'                 => 'El formato del campo: atributo es inválido.' ,
    'required'              => 'El campo: atributo es obligatorio.' ,
    'required_if'           => 'El campo: atributo es obligatorio cuando el campo: otros es: valor'. ,
    'required_unless'       => 'El campo: atributo es requerido a menos que: otros se encuentran en: valores.' ,
    'required_with'         => 'El campo: atributo es obligatorio cuando: valores está presente.' ,
    'required_with_all'     => 'El campo: atributo es obligatorio cuando: valores están presentes.' ,
    'required_without'      => 'El campo: atributo es obligatorio cuando: valores no está presente.' ,
    'required_without_all' => 'El campo: atributo es obligatorio cuando ninguno de los campos: valores están presentes'. ,
    'same'                  => 'Los campos: atributo y: otros deben coincidir.' ,
    'size'                  => [
        'numeric' => 'El campo: atributo debe ser: tamaño'. ,
        'file'     => 'El archivo: atributo debe pesar: tamaño kilobytes'. ,
        'string'   => 'El campo: atributo debe contener: tamaño caracteres.' ,
        'array'    => 'El campo: atributo debe contener: tamaño elementos.' ,
    ],
    'comienza_con'           => 'El campo: atributo debe comenzar con uno de los siguientes valores:: valores' ,
    'string'                => 'El campo: atributo debe ser una cadena de caracteres.' ,
    'timezone'              => 'El campo: atributo debe ser una zona horaria válida.' ,
    'unique'                => 'El valor del campo: atributo ya está en uso.' ,
    'uploaded'              => 'El campo: atributo no se pudo subir.' ,
    'url'                   => 'El formato del campo: atributo es inválido.' ,
    'uuid'                  => 'El campo: atributo debe ser un UUID válido.' ,

    / *
    | ------------------------------------------------- -------------------------
    El | Líneas de lenguaje de validación personalizada
    | ------------------------------------------------- -------------------------
    El |
    El | Aquí puede especificar mensajes de validación personalizados para atributos utilizando el
    El | convención "attribute.rule" para nombrar las líneas. Esto hace que sea rápido
    El | especifique una línea de idioma personalizada específica para una regla de atributo dada.
    El |
    * /

    'personalizado' => [
        'attribute-name' => [
            'rule-name' => 'mensaje personalizado' ,
        ],
    ],

    / *
    | ------------------------------------------------- -------------------------
    El | Atributos de validación personalizados
    | ------------------------------------------------- -------------------------
    El |
    El | Las siguientes líneas de idioma se utilizan para intercambiar marcadores de posición de atributos
    El | con algo más fácil de leer, como la dirección de correo electrónico
    El | de "correo electrónico". Esto simplemente nos ayuda a hacer que los mensajes sean un poco más limpios.
    El |
    * /

    'atributos' => [],

];