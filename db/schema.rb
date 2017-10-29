# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171029225425) do

  create_table "carnets_viejos", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "Nombre"
    t.string "carnet"
    t.integer "documento"
    t.string "tipo"
    t.string "direccion"
    t.string "tel"
    t.integer "tb_tipo_de_carnet", unsigned: true
  end

  create_table "tb_actividad_de_comite", primary_key: "id_actividad_de_comite", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_comite_o_junta", null: false, unsigned: true
    t.string "nombre_de_la_actividad", limit: 70, null: false
    t.date "fecha_desde", null: false
    t.date "fecha_hasta"
    t.text "descripcion"
    t.string "publicar", limit: 2
    t.integer "tb_centro", unsigned: true
    t.integer "tb_diosesis", unsigned: true
    t.integer "tb_sede", unsigned: true
    t.string "file_imagen", limit: 45
    t.index ["fecha_desde"], name: "Index_5"
    t.index ["nombre_de_la_actividad"], name: "Index_4"
    t.index ["tb_comite_o_junta"], name: "Index_3"
  end

  create_table "tb_actividad_de_sede", primary_key: "id_actividad_de_sede", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_sede", null: false, unsigned: true
    t.string "titulo_de_la_actividad", limit: 70, null: false
    t.date "fecha", null: false
    t.string "copete", limit: 250
    t.text "texto"
    t.string "publicar", limit: 2, null: false
    t.index ["fecha"], name: "Index_5"
    t.index ["tb_sede"], name: "Index_2"
    t.index ["titulo_de_la_actividad"], name: "Index_4"
  end

  create_table "tb_ambito_de_curso", primary_key: "id_ambito_de_curso", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "ambito_de_curso", limit: 45, null: false
  end

  create_table "tb_asistente_a_curso", primary_key: "id_asistente_a_curso", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_curso", null: false, unsigned: true
    t.string "aprobo", limit: 2
    t.string "abandono", limit: 2
  end

  create_table "tb_autor", primary_key: "id_autor", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC" do |t|
    t.string "autor", limit: 70, null: false
  end

  create_table "tb_autorizacion", primary_key: "id_autorizacion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_curso", null: false, unsigned: true
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_centro", null: false, unsigned: true
    t.string "observaciones"
  end

  create_table "tb_camara", primary_key: "id_camara", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "camara", limit: 45, null: false
  end

  create_table "tb_capitulo", primary_key: "id_capitulo", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "tb_libro", limit: 45, null: false
    t.string "titulo", limit: 100, null: false
    t.text "texto", null: false
    t.integer "tb_sys_usuario0registrante", unsigned: true
    t.index ["titulo", "texto"], name: "Index_2", type: :fulltext
  end

  create_table "tb_cara_de_carnet", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id_cara_de_carnet", null: false, unsigned: true
    t.string "cara_de_carnet", limit: 45, null: false
  end

  create_table "tb_cargo_de_comite_o_junta", primary_key: "id_cargo_de_comite_o_junta", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "cargo", limit: 45, null: false
    t.integer "tb_comite_o_junta", unsigned: true
    t.string "existe_local", limit: 2, null: false
    t.string "existe_zonal", limit: 2, null: false
    t.string "existe_nacional", limit: 2, null: false
    t.index ["cargo"], name: "Index_2"
    t.index ["tb_comite_o_junta"], name: "Index_3"
  end

  create_table "tb_cargo_de_sede", primary_key: "id_cargo_de_sede", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "cargo_sede", limit: 45, null: false
  end

  create_table "tb_cargo_ejercido_en_comite_o_junta", primary_key: "id_cargo_ejercido", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_cargo_de_comite_o_junta", null: false, unsigned: true
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.integer "tb_causa_de_baja", unsigned: true
    t.integer "tb_centro", unsigned: true
    t.integer "tb_diosesis", unsigned: true
    t.integer "tb_sede", unsigned: true
    t.string "observaciones", limit: 250
  end

  create_table "tb_cargo_ejercido_en_sede", primary_key: "id_cargo_ejercido_en_sede", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_cargo_de_sede", null: false, unsigned: true
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.integer "tb_causa_de_baja", unsigned: true
    t.integer "tb_sede", null: false, unsigned: true
    t.string "observaciones", limit: 250
  end

  create_table "tb_carnet", primary_key: "id_carnet", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_tipo_de_carnet", null: false, unsigned: true
    t.string "confeccionado", limit: 2, null: false
    t.string "pagado", limit: 2
    t.date "fecha_de_pago"
    t.decimal "importe_pagado", precision: 8, scale: 2
    t.date "fecha_de_confeccion"
    t.date "fecha_de_vencimiento"
    t.string "es_renovacion", limit: 2
    t.string "autorizado", limit: 2
    t.string "observaciones", limit: 200
    t.string "nombre_viejo", limit: 100
    t.integer "tb_numero_de_posicion", unsigned: true
    t.integer "tb_cara_de_carnet"
  end

  create_table "tb_causa_de_baja", primary_key: "id_causa_de_baja", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "causa_de_baja", limit: 45, null: false
  end

  create_table "tb_causa_de_salida", primary_key: "id_causa_de_salida", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "causa_de_salida", limit: 45, null: false
  end

  create_table "tb_centro", primary_key: "id_centro", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC" do |t|
    t.string "nombre", limit: 70, null: false
    t.string "direccion", limit: 100, null: false
    t.integer "tb_localidad", null: false, unsigned: true
    t.string "tf_tel_fijo", limit: 50
    t.string "tc_celular", limit: 50
    t.string "mail_correo_electronico", limit: 65
    t.string "pagina_web", limit: 200
    t.string "obsevaciones"
    t.date "fecha_de_apertura"
    t.integer "tb_tipo_de_centro", null: false, unsigned: true
    t.date "fecha_de_cierre"
    t.integer "tb_persona0Administrador", unsigned: true
    t.integer "tb_sede0sede_administradora", null: false, unsigned: true
    t.integer "tb_diosesis", unsigned: true
    t.integer "tb_condicion_de_la_propiedad", unsigned: true
    t.string "tiene_local_filial", limit: 2
    t.string "file_archivo_digitalizado_de_local_filial", limit: 45
    t.index ["nombre"], name: "Index_2"
    t.index ["tb_localidad"], name: "Index_3"
  end

  create_table "tb_comite_o_junta", primary_key: "id_comite_o_junta", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "comite_o_junta", limit: 50, null: false
    t.string "existe_local", limit: 2, null: false
    t.string "existe_zonal", limit: 2, null: false
    t.string "existe_nacional", limit: 2, null: false
  end

  create_table "tb_como_conocio_la_gnosis", primary_key: "id_como_conocio_la_gnosis", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "como_conocio_la_gnosis", limit: 45, null: false
  end

  create_table "tb_condicion_de_la_propiedad", primary_key: "id_condicion_de_la_propiedad", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci" do |t|
    t.string "condicion_de_la_propiedad"
  end

  create_table "tb_condicion_laboral", primary_key: "id_condicion_laboral", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "condicion_laboral", limit: 45, null: false
  end

  create_table "tb_conferencia", primary_key: "id_conferencia", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "titulo_de_la_conferencia", limit: 100, null: false
    t.date "fecha", null: false
    t.string "horario", limit: 30, null: false
    t.string "direccion", limit: 100, null: false
    t.string "ciudad_o_localidad", limit: 45
    t.integer "tb_localidad", null: false, unsigned: true
    t.integer "tb_provincia", unsigned: true
    t.string "latitud_y_longitud_google_maps", limit: 60
    t.string "img_imagen_de_afiche", limit: 30
    t.string "info_de_contacto_tel_cel_mail", limit: 100
    t.string "url_enlace_mas_informacion", limit: 100
    t.string "url_enlace_inscripcion", limit: 100
    t.string "observaciones", limit: 100
    t.string "nombre_del_conferencista", limit: 100, null: false
    t.datetime "timecreate_fecha_de_creacion"
    t.string "revisada", limit: 2
    t.string "habilitada", limit: 2
    t.string "observaciones_de_publicacion", limit: 150
    t.integer "tb_centro", null: false, unsigned: true
    t.index ["ciudad_o_localidad"], name: "Index_3"
    t.index ["direccion"], name: "Index_5"
    t.index ["fecha"], name: "Index_4"
    t.index ["titulo_de_la_conferencia"], name: "Index_2"
  end

  create_table "tb_conferencia_publica", primary_key: "id_conferencia_publica", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre_de_la_conferencia", limit: 80, null: false
    t.date "fecha", null: false
    t.integer "cantidad_de_asistentes", unsigned: true
    t.integer "tb_localidad", null: false, unsigned: true
    t.integer "tb_centro", unsigned: true
    t.integer "tb_persona0disertante", null: false, unsigned: true
    t.string "direccion", limit: 120, null: false
    t.string "file_afiche_o_volante", limit: 45
    t.index ["fecha"], name: "Index_4"
    t.index ["nombre_de_la_conferencia"], name: "Index_2"
    t.index ["tb_persona0disertante"], name: "Index_3"
  end

  create_table "tb_correo", primary_key: "id_correo", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "timecreate_fecha_de_creacion", null: false
    t.string "titulo_del_mail", limit: 100, null: false
    t.integer "tb_template_de_mail", null: false, unsigned: true
    t.integer "tb_publico_de_envio", null: false, unsigned: true
    t.string "file_adjunto_1", limit: 45
    t.integer "tb_persona0persona_para_envio_de_prueba", unsigned: true
    t.string "img_imagen_top", limit: 45
    t.text "texto_a_enviar", limit: 16777215
    t.string "url_enlace", limit: 80
    t.index ["titulo_del_mail"], name: "Index_2"
  end

  create_table "tb_correo_envio", primary_key: "id_correo_envio", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_correo", null: false, unsigned: true
    t.integer "tb_persona", null: false, unsigned: true
    t.datetime "fecha", null: false
    t.string "abierto", limit: 2
    t.string "clikeado", limit: 2
    t.string "aceptado", limit: 2
    t.string "entregado", limit: 2
    t.index ["tb_correo"], name: "Index_2"
    t.index ["tb_persona"], name: "Index_3"
  end

  create_table "tb_curso", primary_key: "id_curso", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_tipo_de_curso", null: false, unsigned: true
    t.date "fecha_desde", null: false
    t.date "fecha_hasta"
    t.string "descripcion", limit: 70
    t.integer "tb_centro", null: false, unsigned: true
    t.integer "tb_ambito_de_curso", null: false, unsigned: true
    t.index ["descripcion"], name: "Index_5"
    t.index ["fecha_desde"], name: "Index_3"
    t.index ["tb_centro"], name: "Index_4"
    t.index ["tb_tipo_de_curso"], name: "Index_2"
  end

  create_table "tb_curso_online", primary_key: "id_curso_online", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "titulo_del_curso_online", limit: 45, null: false
    t.integer "tb_template_de_mail", null: false, unsigned: true
    t.text "texto_inicio_del_curso", limit: 16777215, null: false
    t.text "texto_envio_lecciones", limit: 16777215, null: false
    t.text "texto_fin_del_curso", limit: 16777215, null: false
    t.integer "tb_periodo_de_tiempo", null: false, unsigned: true
  end

  create_table "tb_curso_online_leccion", primary_key: "id_curso_online_leccion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_curso_online", null: false, unsigned: true
    t.integer "nro_de_leccion", null: false, unsigned: true
    t.string "titulo", limit: 45, null: false
    t.string "file_adjunto_1", limit: 60
    t.index ["nro_de_leccion"], name: "Index_3"
    t.index ["tb_curso_online"], name: "Index_2"
  end

  create_table "tb_curso_online_leccion_envio", primary_key: "id_curso_online_leccion_envio", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_curso_online_leccion", null: false, unsigned: true
    t.integer "tb_inscripcion_a_curso_online", null: false, unsigned: true
    t.datetime "fecha", null: false
    t.string "recibido", limit: 2
    t.string "abierto", limit: 2
    t.string "clikeado", limit: 2
    t.string "aceptado", limit: 2
    t.string "entregado", limit: 2
    t.index ["tb_curso_online_leccion"], name: "Index_2"
    t.index ["tb_inscripcion_a_curso_online"], name: "Index_3"
  end

  create_table "tb_debito", primary_key: "id_debito", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.string "confeccionado", limit: 2, null: false
    t.integer "tb_tarjeta"
    t.integer "tb_tipo_de_tarjeta"
    t.string "numero_de_tarjeta", limit: 30
    t.string "debitando", limit: 2
    t.decimal "monto", precision: 10, scale: 2
    t.date "fecha_de_inicio_de_debito"
    t.date "fecha_de_fin_de_debito"
    t.string "observaciones", limit: 80
    t.string "originado_desde_web", limit: 2
  end

  create_table "tb_debito_temp", primary_key: "idtb_debito_temp", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", unsigned: true
    t.integer "documento", unsigned: true
  end

  create_table "tb_declaracion_de_interes", primary_key: "id_declaracion_de_interes", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_declaracion_de_interes", limit: 100, null: false
    t.date "fecha", null: false
    t.string "ciudad_o_localidad", limit: 45, null: false
    t.integer "tb_provincia", null: false, unsigned: true
    t.string "file_archivo_1", limit: 30, null: false
    t.string "file_archivo_2", limit: 30
    t.string "file_archivo_3", limit: 30
    t.string "file_archivo_4", limit: 30
    t.string "file_archivo_5", limit: 30
    t.string "file_archivo_6", limit: 30
    t.string "file_archivo_7", limit: 30
    t.string "file_archivo_8", limit: 30
    t.string "file_archivo_9", limit: 30
    t.string "file_archivo_10", limit: 30
    t.string "observaciones", limit: 250
    t.datetime "timecreate_fecha_de_creacion"
    t.string "revisada", limit: 2
    t.string "habilitada", limit: 2
    t.string "observaciones_de_publicacion", limit: 150
    t.integer "tb_centro", null: false, unsigned: true
    t.index ["ciudad_o_localidad"], name: "Index_2"
    t.index ["habilitada"], name: "Index_5"
    t.index ["revisada"], name: "Index_4"
    t.index ["tb_provincia"], name: "Index_3"
  end

  create_table "tb_dia", primary_key: "id_dia", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "dia", limit: 45, null: false
  end

  create_table "tb_diocesis_ageacac", primary_key: "id_diocesis", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci" do |t|
    t.string "nombre", null: false
    t.string "encargado"
    t.string "pais"
    t.index ["nombre"], name: "nombre", unique: true
  end

  create_table "tb_diosesis", primary_key: "id_diosesis", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "denominacion_de_la_diosesis", limit: 70
    t.integer "tb_sede", null: false, unsigned: true
    t.date "fecha_desde", null: false
    t.date "fecha_hasta"
    t.string "nombre_de_usuario", limit: 45
    t.string "clave", limit: 45
    t.index ["denominacion_de_la_diosesis"], name: "Index_2"
    t.index ["fecha_desde"], name: "Index_3"
  end

  create_table "tb_estado", primary_key: "id_estado", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "estado", collation: "latin1_spanish_ci"
    t.string "pais", collation: "latin1_spanish_ci"
    t.index ["estado"], name: "Index_2"
  end

  create_table "tb_estado_civil", primary_key: "id_estado_civil", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "estado_civil", limit: 45, null: false
  end

  create_table "tb_evento", primary_key: "id_evento", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "evento", limit: 45, null: false
    t.date "fecha_inicio", null: false
    t.date "fecha_fin", null: false
    t.integer "cantidad_de_inscriptos", null: false, unsigned: true
    t.string "habilitada_para_inscripcion_web", limit: 2
  end

  create_table "tb_evento_mailing", primary_key: "id_evento_mailing", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "numero_id", limit: 45
    t.string "mail", limit: 60
    t.string "event", limit: 15
    t.string "tag", limit: 45
    t.text "texto_log_completo", limit: 16777215
    t.string "timestamp", limit: 15
  end

  create_table "tb_familiar", primary_key: "id_familiar", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona0Persona_1", null: false, unsigned: true
    t.integer "tb_parentezco", null: false, unsigned: true
    t.integer "tb_persona0Persona_2", null: false, unsigned: true
    t.index ["tb_persona0Persona_1", "tb_persona0Persona_2"], name: "Index_2", unique: true
  end

  create_table "tb_frase_en_imagen", primary_key: "id_frase_en_imagen", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC" do |t|
    t.string "img_imagen", limit: 45, null: false
    t.string "revisada", limit: 2
    t.string "habilitada", limit: 2
    t.datetime "timecreate_fecha_de_creacion", null: false
  end

  create_table "tb_imagen_actividad_de_comite", primary_key: "id_imagen_actividad_de_comite", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_actividad_de_comite", null: false, unsigned: true
    t.string "file_imagen", limit: 45, null: false
    t.string "descripcion", limit: 250
  end

  create_table "tb_imagen_actividad_de_sede", primary_key: "id_imagen_actividad_de_sede", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_actividad_de_sede", null: false, unsigned: true
    t.string "file_imagen", limit: 45, null: false
    t.string "descripcion", limit: 250
  end

  create_table "tb_ingreso_a_segunda", primary_key: "id_ingreso_a_segunda", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.string "instructores", limit: 200
    t.date "fecha_de_ingreso"
    t.integer "tb_centro0lumisial_de_ingreso", unsigned: true
    t.string "otro_lumisial_de_ingreso", limit: 150
    t.string "persona_que_lo_consagro", limit: 70
    t.index ["tb_centro0lumisial_de_ingreso"], name: "Index_3"
    t.index ["tb_persona"], name: "Index_2"
  end

  create_table "tb_inscripcion_a_alerta_de_eventos", primary_key: "id_inscripcion_a_alerta_de_eventos", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "timecreate_fecha_de_creacion"
    t.string "nombre", limit: 45, null: false
    t.string "apellido", limit: 45, null: false
    t.integer "tb_localidad", null: false
    t.string "mail_email", limit: 80, null: false
    t.string "tf_tel_fijo", limit: 45
    t.string "tc_celular", limit: 45
    t.string "deseo_suscribirme_al_newsletter", limit: 2
    t.string "correo_validado", limit: 2
    t.string "hash_validacion", limit: 60
    t.text "comentarios", limit: 255
  end

  create_table "tb_inscripcion_a_curso_online", primary_key: "id_inscripcion_a_curso_online", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_curso_online", null: false, unsigned: true
    t.datetime "timecreate_fecha_de_creacion"
    t.string "nombre", limit: 45, null: false
    t.string "apellido", limit: 45, null: false
    t.string "mail_email", limit: 80, null: false
    t.integer "tb_localidad"
    t.text "comentarios", limit: 255
    t.string "deseo_suscribirme_al_newsletter", limit: 2, null: false
    t.string "deseo_suscribirme_a_alertas_de_eventos_en_mi_ciudad", limit: 2, null: false
    t.string "hash_validacion", limit: 120
    t.string "correo_validado", limit: 2
    t.string "curso_finalizado", limit: 2, null: false
    t.string "aceptado", limit: 2
    t.string "entregado", limit: 2
    t.string "abierto", limit: 2
    t.string "clikeado", limit: 2
    t.index ["apellido"], name: "Index_3"
    t.index ["mail_email"], name: "Index_4"
    t.index ["nombre"], name: "Index_2"
    t.index ["tb_localidad"], name: "Index_5"
  end

  create_table "tb_inscripcion_a_evento_publico", primary_key: "id_inscripcion_a_evento_publico", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "timecreate_fecha_de_creacion", null: false
    t.string "nombre", limit: 45, null: false
    t.string "apellido", limit: 45, null: false
    t.string "email", limit: 45, null: false
    t.string "telefono", limit: 45
    t.integer "tb_conferencia", null: false, unsigned: true
  end

  create_table "tb_inscripcion_a_newsletter", primary_key: "id_inscripcion_a_newsletter", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 45, null: false
    t.string "apellido", limit: 45, null: false
    t.string "mail_email", limit: 80, null: false
    t.integer "tb_localidad"
    t.text "comentario", limit: 255
  end

  create_table "tb_inscripcion_en_evento", primary_key: "id_inscripcion_en_evento", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AVG_ROW_LENGTH=111" do |t|
    t.datetime "fecha_inscripcion", null: false
    t.integer "tb_evento", null: false
    t.integer "numero", null: false
    t.string "numero_de_documento"
    t.string "nombreAp"
    t.string "pais"
    t.string "diocesis"
    t.string "santuario"
    t.integer "hijos"
    t.integer "tb_persona", null: false, unsigned: true
    t.string "provincia", limit: 70
    t.string "ciudad", limit: 70
  end

  create_table "tb_instructor_de_curso", primary_key: "id_instructor_de_curso", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona0instructor", null: false, unsigned: true
    t.integer "tb_curso", null: false, unsigned: true
  end

  create_table "tb_instructor_primera_camara", primary_key: "id_instructor_primera_camara", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona0instructor", null: false, unsigned: true
    t.date "fecha_desde", null: false
    t.date "fecha_hasta"
    t.integer "tb_primera_camara", null: false, unsigned: true
  end

  create_table "tb_libro", primary_key: "id_libro", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC" do |t|
    t.string "titulo", limit: 100, null: false
    t.integer "tb_autor", null: false, unsigned: true
    t.string "img_portada_original", limit: 45
    t.integer "tb_sys_usuario0registrante", unsigned: true
  end

  create_table "tb_localidad", primary_key: "id_localidad", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "localidad", limit: 80, null: false
    t.integer "tb_provincia", null: false, unsigned: true
    t.index ["localidad"], name: "Index_2"
    t.index ["tb_provincia"], name: "Index_3"
  end

  create_table "tb_lumisial_resultante_de_centro", primary_key: "id_lumisial_resultante_de_centro", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_centro0centro_de_difusion", null: false, unsigned: true
    t.integer "tb_centro0lumisial_abierto", null: false, unsigned: true
  end

  create_table "tb_maestro", primary_key: "id_maestro", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_centro0lugar_donde_fue_ungido", null: false, unsigned: true
    t.date "fecha_desde", null: false
    t.date "fecha_hasta"
    t.integer "tb_causa_de_baja", unsigned: true
    t.string "nombre_interno", limit: 80, null: false
    t.string "observaciones", limit: 250
  end

  create_table "tb_material", primary_key: "id_material", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC" do |t|
    t.integer "tb_tipo_de_material", null: false, unsigned: true
    t.string "titulo", limit: 150, null: false
    t.text "observaciones", limit: 255
    t.string "file_archivo", limit: 45
    t.string "url_enlace", limit: 100
    t.index ["titulo", "observaciones"], name: "Index_2", type: :fulltext
  end

  create_table "tb_menu_1", primary_key: "id_menu_1", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_micrositio", null: false, unsigned: true
    t.string "nombre_en_el_menu", limit: 45, null: false
    t.integer "nro_de_orden", null: false, unsigned: true
    t.integer "tb_pagina", unsigned: true
    t.string "url_enlace", limit: 60
    t.index ["nombre_en_el_menu"], name: "Index_3"
    t.index ["tb_micrositio"], name: "Index_2"
  end

  create_table "tb_menu_2", primary_key: "id_menu_2", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre_en_el_menu", limit: 45, null: false
    t.integer "tb_menu_1", null: false, unsigned: true
    t.integer "nro_de_orden", null: false, unsigned: true
    t.integer "tb_pagina", unsigned: true
    t.string "url_enlace", limit: 60
    t.index ["nombre_en_el_menu"], name: "Index_3"
    t.index ["tb_menu_1"], name: "Index_2"
  end

  create_table "tb_micrositio", primary_key: "id_micrositio", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_subdominio", null: false, unsigned: true
    t.string "titulo_del_micrositio", limit: 150, null: false
    t.string "sub_titulo_del_micrositio", limit: 200, null: false
    t.string "encabezado_tel", limit: 60
    t.string "url_enlace_facebook", limit: 60
    t.string "url_enlace_twitter", limit: 60
    t.string "url_enlace_youtube", limit: 60
    t.string "url_enlace_google_plus", limit: 60
    t.text "rtf_contenido_cuerpo", limit: 16777215
    t.text "texto_pie_de_pagina", limit: 16777215
    t.integer "tb_sys_usuario0usuario_gestor", null: false, unsigned: true
  end

  create_table "tb_micrositio_img_de_slider", primary_key: "id_micrositio_img_de_slider", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_micrositio", null: false
    t.string "img_archivo_de_imagen", limit: 45, null: false
    t.string "texto_a_mostrar_en_imagen", limit: 150
    t.integer "tb_pagina", unsigned: true
    t.string "url_enlace", limit: 60
    t.integer "nro_de_orden", unsigned: true
  end

  create_table "tb_mision", primary_key: "id_mision", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "mision", null: false
    t.date "fecha_desde", null: false
    t.date "fecha_hasta", null: false
    t.integer "tb_misionero", null: false, unsigned: true
  end

  create_table "tb_misionero", primary_key: "id_misionero", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_tipo_de_misionero", null: false, unsigned: true
    t.integer "tb_centro0lugar_donde_realizo_el_curso", unsigned: true
    t.integer "numero_de_curso", unsigned: true
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.string "esta_a_disponibilidad", limit: 2
    t.string "activo", limit: 2
    t.integer "tb_causa_de_baja", unsigned: true
    t.integer "numero_de_credencial", unsigned: true
    t.string "instructores", limit: 150
    t.string "observaciones", limit: 250
    t.index ["tb_centro0lugar_donde_realizo_el_curso"], name: "Index_4"
    t.index ["tb_persona"], name: "Index_2"
    t.index ["tb_tipo_de_misionero"], name: "Index_3"
  end

  create_table "tb_misioneros_excel", primary_key: "id_misioneros_excel", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 45, null: false
    t.string "apellido", limit: 45, null: false
    t.integer "nro_de_documento", null: false, unsigned: true
    t.integer "tb_tipo_de_misionero", null: false, unsigned: true
  end

  create_table "tb_nacionalidad", primary_key: "id_nacionalidad", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nacionalidad", limit: 45, null: false
  end

  create_table "tb_numero_de_posicion", primary_key: "id_numero_de_posicion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "numero_de_posicion", limit: 45, null: false
  end

  create_table "tb_obispo", primary_key: "id_obispo", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_centro0templo_donde_fue_ungido", null: false, unsigned: true
    t.date "fecha_desde", null: false
    t.date "fecha_hasta"
    t.integer "tb_causa_de_baja", unsigned: true
    t.integer "tb_tipo_de_obispo", null: false, unsigned: true
    t.string "observaciones", limit: 250
    t.string "persona_que_lo_ungio", limit: 100
  end

  create_table "tb_pagina", primary_key: "id_pagina", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_micrositio", null: false, unsigned: true
    t.string "nombre", limit: 45, null: false
    t.text "rtf_contenido", null: false
    t.index ["nombre"], name: "Index_3"
    t.index ["tb_micrositio"], name: "Index_2"
  end

  create_table "tb_pais", primary_key: "id_pais", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pais", limit: 45, null: false, collation: "latin1_spanish_ci"
  end

  create_table "tb_parentezco", primary_key: "id_parentezco", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "parentezco", limit: 45, null: false
  end

  create_table "tb_participacion", primary_key: "id_participacion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_centro", null: false, unsigned: true
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.integer "tb_camara", null: false, unsigned: true
    t.integer "tb_causa_de_salida", unsigned: true
    t.index ["tb_camara"], name: "Index_4"
    t.index ["tb_centro"], name: "Index_3"
    t.index ["tb_persona"], name: "Index_2"
  end

  create_table "tb_periodo_de_tiempo", primary_key: "id_periodo_de_tiempo", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "periodo_de_tiempo", limit: 45, null: false
  end

  create_table "tb_persona", primary_key: "id_persona", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT" do |t|
    t.string "nombre", limit: 45, collation: "latin1_spanish_ci"
    t.string "apellido", limit: 45, collation: "latin1_spanish_ci"
    t.integer "tb_tipo_de_documento", unsigned: true
    t.integer "numero_de_documento", unsigned: true
    t.integer "tb_nacionalidad"
    t.integer "tb_nacionalidad0doble_nacionalidad"
    t.integer "tb_sexo"
    t.date "fecha_de_nacimiento"
    t.string "lugar_de_nacimiento", limit: 50
    t.string "domicilio", limit: 65
    t.integer "tb_localidad"
    t.string "tf_tel_fijo", limit: 50
    t.string "tc_celular", limit: 50
    t.string "mail_correo_electronico", limit: 65
    t.integer "tb_estado_civil", unsigned: true
    t.string "profesion_u_oficio", limit: 45
    t.integer "tb_condicion_laboral", unsigned: true
    t.string "lugar_de_trabajo", limit: 200
    t.string "otros_datos"
    t.string "file_fotografia", limit: 45
    t.string "estudios", limit: 45
    t.string "idiomas", limit: 80
    t.string "fax", limit: 50
    t.string "representante_en_caso_de_ser_menor", limit: 80
    t.string "observaciones", limit: 250
    t.string "duplicado", limit: 2
    t.datetime "timemodify_ultima_modificacion"
    t.integer "id_importacion", unsigned: true
    t.string "file_fotografia_subida", limit: 45
    t.string "creado_desde_web", limit: 2
    t.index ["apellido"], name: "Index_3"
    t.index ["nombre"], name: "Index_2"
    t.index ["numero_de_documento"], name: "Index_4"
  end

  create_table "tb_persona_ageacac", primary_key: ["id_persona", "nombre", "apellido"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT" do |t|
    t.integer "id_persona", null: false, unsigned: true
    t.string "nombre", limit: 60, default: "", null: false
    t.string "apellido", limit: 60, default: "", null: false
    t.integer "numero_de_documento", null: false
    t.string "celular", limit: 80
    t.string "domicilio", limit: 100
    t.string "file_fotografia", limit: 100
    t.datetime "fecha_de_nacimiento"
  end

  create_table "tb_persona_con_duplicado", primary_key: "id_persona", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT" do |t|
    t.string "apellido", limit: 45
    t.string "nombre", limit: 45, collation: "latin1_spanish_ci"
    t.integer "tb_tipo_de_documento", unsigned: true
    t.integer "numero_de_documento", unsigned: true
    t.date "fecha_de_nacimiento"
    t.string "lugar_de_nacimiento", limit: 50
    t.string "domicilio", limit: 65
    t.string "localidad", limit: 80
    t.string "telefonos", limit: 50
    t.string "celulares", limit: 50
    t.string "email", limit: 65
    t.integer "tb_estado_civil", unsigned: true
    t.string "profesion_u_oficio", limit: 45
    t.integer "tb_condicion_laboral", unsigned: true
    t.string "lugar_de_trabajo", limit: 200
    t.string "otros_datos"
    t.string "file_fotografia", limit: 45
    t.string "estudios", limit: 45
    t.string "nacionalidad", limit: 60
    t.string "fax", limit: 50
    t.string "representante_en_caso_de_ser_menor", limit: 80
    t.integer "tb_sexo", unsigned: true
    t.string "observaciones", limit: 250
    t.string "duplicado", limit: 2
    t.integer "id_jujuy", unsigned: true
    t.index ["apellido"], name: "Index_2"
    t.index ["nombre"], name: "Index_3"
    t.index ["numero_de_documento", "tb_tipo_de_documento"], name: "Index_4"
  end

  create_table "tb_persona_sincomas", primary_key: "id_persona", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT" do |t|
    t.string "apellido", limit: 45
    t.string "nombre", limit: 45, collation: "latin1_spanish_ci"
    t.integer "tb_tipo_de_documento", unsigned: true
    t.integer "numero_de_documento", unsigned: true
    t.date "fecha_de_nacimiento"
    t.string "lugar_de_nacimiento", limit: 50
    t.string "domicilio", limit: 65
    t.string "localidad", limit: 80
    t.string "telefonos", limit: 50
    t.string "celulares", limit: 50
    t.string "email", limit: 65
    t.integer "tb_estado_civil", unsigned: true
    t.string "profesion_u_oficio", limit: 45
    t.integer "tb_condicion_laboral", unsigned: true
    t.string "lugar_de_trabajo", limit: 200
    t.string "otros_datos"
    t.string "file_fotografia", limit: 45
    t.string "estudios", limit: 45
    t.string "nacionalidad", limit: 60
    t.string "fax", limit: 50
    t.string "representante_en_caso_de_ser_menor", limit: 80
    t.integer "tb_sexo", unsigned: true
    t.string "observaciones", limit: 250
    t.string "duplicado", limit: 2
    t.index ["apellido"], name: "Index_2"
    t.index ["nombre"], name: "Index_3"
    t.index ["numero_de_documento", "tb_tipo_de_documento"], name: "Index_4"
  end

  create_table "tb_preinscripcion_a_evento", primary_key: "id_preinscripcion_a_evento", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "fecha_de_inscripcion", null: false
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_evento", null: false, unsigned: true
    t.integer "tb_persona0rector_que_autorizo_el_paz_y_salvo", unsigned: true
    t.datetime "fecha_de_autorizacion"
    t.integer "tb_inscripcion_en_evento", unsigned: true
    t.string "hash_validacion", limit: 120, null: false
    t.string "autorizado", limit: 2
  end

  create_table "tb_primera_camara", primary_key: "id_primera_camara", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "titulo_del_curso", limit: 100, null: false
    t.date "fecha_de_inicio", null: false
    t.integer "tb_dia0dia_1", null: false, unsigned: true
    t.string "horario_dia_1", limit: 30, null: false
    t.integer "tb_dia0dia_2", unsigned: true
    t.string "horario_dia_2", limit: 30
    t.string "direccion", limit: 100, null: false
    t.string "ciudad_o_localidad", limit: 45
    t.integer "tb_localidad", null: false
    t.integer "tb_provincia", unsigned: true
    t.string "latitud_y_longitud_google_maps", limit: 60
    t.string "img_imagen_de_afiche", limit: 30
    t.string "info_de_contacto_tel_cel_mail", limit: 100
    t.string "url_enlace_mas_informacion", limit: 45
    t.string "url_enlace_inscripcion", limit: 45
    t.string "observaciones", limit: 100
    t.string "nombre_del_instructor", limit: 100
    t.datetime "timecreate_fecha_de_creacion"
    t.string "revisada", limit: 2
    t.string "habilitada", limit: 2
    t.string "observaciones_de_publicacion", limit: 150
    t.integer "tb_centro", null: false, unsigned: true
    t.index ["ciudad_o_localidad"], name: "Index_3"
    t.index ["habilitada"], name: "Index_6"
    t.index ["revisada"], name: "Index_5"
    t.index ["tb_provincia"], name: "Index_4"
  end

  create_table "tb_primera_camara_sist", primary_key: "id_primera_camara", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "cantidad_de_asistentes", unsigned: true
    t.integer "cantidad_de_ingresos_a_2da_camara", unsigned: true
    t.integer "tb_centro", null: false, unsigned: true
    t.date "fecha_desde", null: false
    t.date "fecha_hasta"
    t.string "dias_y_horarios", limit: 70, null: false
    t.integer "tb_conferencia_publica0abierta_por_conf_publica", unsigned: true
    t.index ["dias_y_horarios"], name: "Index_4"
    t.index ["fecha_desde"], name: "Index_3"
    t.index ["tb_centro"], name: "Index_2"
  end

  create_table "tb_provincia", primary_key: "id_provincia", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "provincia", limit: 70, null: false
    t.string "latitud_longitud", limit: 45
    t.integer "tb_subdominio", null: false, unsigned: true
    t.index ["provincia"], name: "Index_3"
  end

  create_table "tb_provincia_sysigca", primary_key: "id_provincia", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "provincia", limit: 70, null: false
    t.integer "tb_pais", null: false, unsigned: true
    t.index ["provincia"], name: "Index_3"
    t.index ["tb_pais"], name: "Index_2"
  end

  create_table "tb_publico_de_envio", primary_key: "id_publico_de_envio", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "publico_de_envio", limit: 45, null: false
  end

  create_table "tb_reconsagracion", primary_key: "id_reconsagracion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_centro", null: false, unsigned: true
    t.date "fecha_de_reconsagracion", null: false
    t.string "nuevo_nombre", limit: 70
    t.string "nueva_direccion", limit: 100
    t.integer "tb_localidad0nueva_localidad", unsigned: true
    t.string "observaciones", limit: 180
    t.date "fecha_de_cierre"
  end

  create_table "tb_rector_de_diocesis", primary_key: "id_rector_de_diocesis", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona0rector", null: false, unsigned: true
    t.integer "tb_diosesis", unsigned: true
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.index ["fecha_desde"], name: "Index_4"
    t.index ["tb_diosesis"], name: "Index_3"
    t.index ["tb_persona0rector"], name: "Index_2"
  end

  create_table "tb_rectoria_local", primary_key: "id_rectoria_local", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona0rector", null: false, unsigned: true
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.integer "tb_causa_de_baja", unsigned: true
    t.integer "tb_centro", null: false, unsigned: true
    t.index ["tb_centro"], name: "Index_3"
    t.index ["tb_persona0rector"], name: "Index_2"
  end

  create_table "tb_registro_de_accion_web", primary_key: "id_registro_de_accion_web", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false, unsigned: true
    t.integer "tb_persona", null: false, unsigned: true
    t.datetime "fecha", null: false
    t.string "accion", limit: 45, null: false
  end

  create_table "tb_registro_ejecucion_script", primary_key: "id_registro_ejecucion_script", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "fecha", null: false
    t.string "script", limit: 60, null: false
    t.string "ip", limit: 20, null: false
    t.string "llego_al_final", limit: 2, null: false
  end

  create_table "tb_reingreso_a_segunda", primary_key: "id_reingreso_a_segunda", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.string "instructores", limit: 200
    t.date "fecha_de_reingreso", null: false
    t.integer "tb_centro0lumisial_de_reingreso", unsigned: true
    t.string "otro_lumisial_de_reingreso", limit: 100
    t.string "razon_por_la_que_salio", limit: 250
    t.date "fecha_hasta"
  end

  create_table "tb_rel_diosesis_centro", primary_key: "id_rel_diosesis_centro", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_diosesis", null: false, unsigned: true
    t.integer "tb_centro", null: false, unsigned: true
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.index ["tb_centro"], name: "Index_3"
    t.index ["tb_diosesis"], name: "Index_2"
  end

  create_table "tb_sacramento", primary_key: "id_sacramento", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "sacramento", limit: 45, null: false
  end

  create_table "tb_sacramento_recibido", primary_key: "id_sacramento_recibido", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_sacramento", null: false, unsigned: true
    t.date "fecha"
    t.integer "tb_centro", unsigned: true
    t.index ["tb_centro"], name: "Index_4"
    t.index ["tb_persona"], name: "Index_2"
    t.index ["tb_sacramento"], name: "Index_3"
  end

  create_table "tb_sancion", primary_key: "id_sancion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_tipo_de_sancion", null: false, unsigned: true
    t.date "fecha_desde", null: false
    t.date "fecha_hasta"
    t.text "causa_de_sancion"
  end

  create_table "tb_santuario", primary_key: "id_santuario", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci" do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "telefono"
    t.string "provincia", limit: 40
    t.string "ciudad", limit: 60
    t.integer "tb_diocesis", unsigned: true
    t.integer "tb_tipo_de_santuario", unsigned: true
    t.integer "tb_estado", unsigned: true
    t.string "nombre_de_usuario", limit: 200
    t.string "clave_de_usuario", limit: 45
    t.index ["ciudad"], name: "Index_4"
    t.index ["nombre"], name: "Index_2"
    t.index ["tb_estado"], name: "Index_3"
  end

  create_table "tb_sede", primary_key: "id_sede", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_pais", null: false, unsigned: true
  end

  create_table "tb_sede_de_difusion", primary_key: "id_sede_de_difusion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "direccion", limit: 150
    t.integer "tb_localidad", null: false
    t.string "latitud_y_longitud_google_maps", limit: 60
    t.string "url_enlace_a_mapa_de_ubicacion", limit: 300
    t.string "telefonos_fijos", limit: 100
    t.string "telefonos_celulares", limit: 130
    t.string "correos", limit: 250
    t.string "otra_informacion_adicional", limit: 250
    t.integer "tb_centro", null: false, unsigned: true
    t.string "revisada", limit: 2, null: false
    t.string "habilitada", limit: 2
    t.string "observaciones_de_publicacion", limit: 150
    t.index ["tb_centro"], name: "Index_4"
    t.index ["tb_localidad"], name: "Index_2"
  end

  create_table "tb_sexo", primary_key: "id_sexo", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "sexo", limit: 45, null: false
  end

  create_table "tb_solicitud_de_alta_clave", primary_key: "id_solicitud_de_alta_clave", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 45, null: false
    t.string "apellido", limit: 45, null: false
    t.string "nro_de_documento", limit: 20, null: false
    t.string "email", limit: 45, null: false
    t.string "celular", limit: 45, null: false
    t.integer "tb_centro", null: false, unsigned: true
    t.string "cargo_en_el_santuario", limit: 150, null: false
    t.text "observaciones", limit: 16777215
    t.string "revisada", limit: 2
    t.string "habilitada", limit: 2
    t.text "observaciones_de_publicacion", limit: 16777215
    t.integer "tb_sys_usuario", unsigned: true
    t.index ["habilitada"], name: "Index_3"
    t.index ["nro_de_documento"], name: "Index_5"
    t.index ["revisada"], name: "Index_2"
    t.index ["tb_centro"], name: "Index_4"
  end

  create_table "tb_solicitud_de_instructor_en_localidad", primary_key: "id_inscripcion_a_alerta_de_eventos", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "timecreate_fecha_de_creacion"
    t.string "nombre", limit: 45, null: false
    t.string "apellido", limit: 45, null: false
    t.string "mail_email", limit: 80, null: false
    t.string "tf_tel_fijo", limit: 45
    t.string "tc_celular", limit: 45
    t.string "ciudad_o_localidad", limit: 70, null: false
    t.integer "tb_provincia", null: false, unsigned: true
    t.text "comentarios", limit: 255
  end

  create_table "tb_subdominio", primary_key: "id_subdominio", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "subdominio", limit: 100, null: false
    t.string "redireccion", limit: 80, null: false
  end

  create_table "tb_sys_grupo", primary_key: "id_grupo", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "grupo", limit: 50, null: false
  end

  create_table "tb_sys_log_login", primary_key: "id_sys_log_login", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "fecha", null: false
    t.string "ip", limit: 15, null: false
    t.string "ingreso", limit: 2, null: false
    t.string "usuario", limit: 45, null: false
    t.integer "error", null: false, unsigned: true
  end

  create_table "tb_sys_log_operacion", primary_key: "id_operacion", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_sys_log_tipo_de_operacion", null: false, unsigned: true
    t.datetime "fecha_y_hora", null: false
    t.integer "tb_sys_usuario", default: 0, null: false
    t.binary "detalle_de_operacion", null: false
    t.string "tabla", limit: 80, null: false
    t.string "nombre_de_estacion", limit: 60, null: false
    t.string "ip_de_estacion", limit: 30, null: false
    t.index ["tb_sys_usuario"], name: "tb_audita_FKIndex1"
  end

  create_table "tb_sys_log_tablas_afectadas", primary_key: "id_sys_log_tablas_afectadas", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre_de_tabla", limit: 190, null: false
    t.integer "tb_sys_log_tipo_de_operacion", null: false, unsigned: true
    t.string "habilitar_registro_de_operacion", limit: 2, null: false
  end

  create_table "tb_sys_log_tipo_de_operacion", primary_key: "id_tipo_de_operacion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_operacion", limit: 45, null: false
  end

  create_table "tb_sys_modulo", primary_key: "id_modulo", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "modulo", limit: 30
    t.integer "nro_de_orden", unsigned: true
  end

  create_table "tb_sys_opcion", primary_key: ["id_opcion", "tb_sys_modulo", "opcion"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id_opcion", null: false, unsigned: true
    t.integer "tb_sys_modulo", null: false, unsigned: true
    t.string "opcion", limit: 50, null: false
    t.integer "tb_sys_tipo_de_opcion", unsigned: true
    t.string "nombre_de_tabla", limit: 50
    t.string "enlace", limit: 100
    t.string "enlace_rep_general_especifico", limit: 100
    t.string "enlace_rep_individual_especifico", limit: 100
    t.string "enlace_modificacion_especifico", limit: 100
    t.string "enlace_alta_especifico", limit: 100
    t.string "enlace_baja_especifico", limit: 100
    t.string "enlace_profundizar_especifico", limit: 100
    t.string "enlace_enviar_mail_especifico", limit: 100
    t.integer "nro_de_orden", unsigned: true
    t.string "restriccion_listar_where", limit: 250
    t.string "campos_ocultos", limit: 250
    t.string "redireccion_posterior", limit: 100
    t.string "habilitar_busqueda", limit: 2
    t.string "campo_de_filtro", limit: 45
    t.string "campos_ocultos_listar", limit: 250
    t.string "campos_obligatorios", limit: 250
    t.string "vista_especifica", limit: 150
    t.string "otro_enlace_1", limit: 100
    t.string "icono_otro_enlace_1", limit: 45
    t.string "otro_enlace_2", limit: 100
    t.string "icono_otro_enlace_2", limit: 45
    t.string "otro_enlace_3", limit: 100
    t.string "icono_otro_enlace_3", limit: 45
    t.string "parametros_enviar_mail", limit: 250
    t.string "tablas_a_no_profundizar", limit: 250
    t.string "campos_a_totalizar", limit: 200
    t.index ["opcion"], name: "opcion"
    t.index ["tb_sys_modulo"], name: "tb_opciones_FKIndex1"
  end

  create_table "tb_sys_orientacion", primary_key: "id_orientacion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "orientacion", limit: 45, null: false
  end

  create_table "tb_sys_permiso", primary_key: "id_permiso", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_sys_rol", null: false, unsigned: true
    t.integer "tb_sys_opcion", null: false, unsigned: true
    t.string "agregar", limit: 2
    t.string "ver", limit: 2
    t.string "modificar", limit: 2
    t.string "borrar", limit: 2
    t.string "profundizar", limit: 2
    t.string "enviar_mail", limit: 2
    t.string "restriccion_listar", limit: 250
    t.string "reporte_general_generico", limit: 2
    t.string "reporte_general_especifico", limit: 2
    t.string "reporte_individual_generico", limit: 2
    t.string "reporte_individual_especifico", limit: 2
    t.string "agregar_especifica", limit: 2
    t.string "modificar_especifica", limit: 2
    t.string "borrar_especifica", limit: 2
    t.string "profundizar_especifico", limit: 2
    t.string "enviar_mail_especifico", limit: 2
    t.string "restriccion_listar_where", limit: 250
    t.string "campos_obligatorios", limit: 100
    t.string "permitir_otro_enlace_1", limit: 2
    t.string "permitir_otro_enlace_2", limit: 2
    t.string "permitir_otro_enlace_3", limit: 2
    t.index ["tb_sys_opcion"], name: "tb_permiso_FKIndex1"
    t.index ["tb_sys_rol"], name: "tb_permiso_FKIndex2"
  end

  create_table "tb_sys_personal", primary_key: ["id_personal", "tb_persona", "nombre", "apellido"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC" do |t|
    t.integer "id_personal", null: false, unsigned: true
    t.string "nombre", limit: 60, null: false
    t.string "apellido", limit: 60, null: false
    t.integer "tb_persona", null: false, unsigned: true
    t.string "email", limit: 100
    t.string "firma_email", limit: 250
    t.date "fecha_de_baja"
    t.string "file_fotografia", limit: 45
  end

  create_table "tb_sys_rel_grupo_rol", primary_key: "id_rel_grupo_rol", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_sys_rol", null: false, unsigned: true
    t.integer "tb_sys_grupo", null: false, unsigned: true
    t.index ["tb_sys_grupo"], name: "tb_rel_grupo_rol_FKIndex1"
    t.index ["tb_sys_rol"], name: "tb_rel_grupo_rol_FKIndex2"
  end

  create_table "tb_sys_rel_usuario_grupo", primary_key: "id_rel_usuario_grupo", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_sys_grupo", null: false, unsigned: true
    t.integer "tb_sys_usuario", null: false, unsigned: true
    t.index ["tb_sys_grupo"], name: "tb_rel_usuario_grupo_FKIndex2"
    t.index ["tb_sys_usuario"], name: "tb_rel_usuario_grupo_FKIndex1"
  end

  create_table "tb_sys_reporte_grafico", primary_key: "id_reporte_grafico", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_sys_opcion", null: false, unsigned: true
    t.integer "tb_sys_tipo_de_grafico", null: false, unsigned: true
    t.string "titulo_de_grafico", limit: 200
    t.string "titulo_eje_x", limit: 200
    t.string "titulo_eje_y", limit: 200
    t.string "prefijo_para_valores_numericos", limit: 45
    t.string "valor_de_rotacion", limit: 45
    t.string "alto_de_grafico", limit: 45
    t.string "ancho_de_grafico", limit: 45
    t.integer "tb_sys_orientacion", null: false, unsigned: true
    t.string "mostrar_tabla", limit: 2, null: false
    t.string "mostrar_grafico", limit: 2, null: false
    t.string "campos_a_totalizar", limit: 200
  end

  create_table "tb_sys_restriccion_abm", primary_key: "id_restriccion_abm", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_sys_permiso", null: false, unsigned: true
    t.string "campo", limit: 40
    t.binary "restriccion_abm"
    t.string "restriccion_where", limit: 250
    t.index ["tb_sys_permiso"], name: "tb_restriccion_abm_FKIndex1"
  end

  create_table "tb_sys_rol", primary_key: "id_rol", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rol", limit: 50, null: false
  end

  create_table "tb_sys_tipo_de_grafico", primary_key: "id_tipo_de_grafico", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_grafico", limit: 70, null: false
    t.string "nombre_de_archivo_single_serie", limit: 100
    t.string "nombre_de_archivo_multi_serie", limit: 100
  end

  create_table "tb_sys_tipo_de_opcion", primary_key: "id_tipo_de_opcion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_opcion", limit: 45, null: false
  end

  create_table "tb_sys_usuario", primary_key: ["id_usuario", "tb_sys_personal", "usuario"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC" do |t|
    t.integer "id_usuario", null: false, unsigned: true
    t.string "usuario", limit: 30, null: false
    t.string "clave", limit: 250, null: false
    t.string "habilitado", limit: 2, null: false
    t.integer "tb_sys_personal", null: false, unsigned: true
    t.integer "tb_centro", default: 0, unsigned: true
    t.integer "tb_persona", default: 0, unsigned: true
    t.integer "tb_diosesis", unsigned: true
    t.index ["usuario"], name: "usuario"
  end

  create_table "tb_tarjeta", primary_key: "id_tarjeta", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tarjeta", limit: 45, null: false
  end

  create_table "tb_template_de_mail", primary_key: "id_template_de_mail", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre_del_template_de_mail", limit: 45, null: false
    t.text "codigo_html", null: false
  end

  create_table "tb_tipo_de_actividad_misional", primary_key: "id_tipo_de_actividad_misional", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_actividad_misional", limit: 45, null: false
  end

  create_table "tb_tipo_de_carnet", primary_key: "id_tipo_de_carnet", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_carnet", limit: 45, null: false
  end

  create_table "tb_tipo_de_centro", primary_key: "id_tipo_de_centro", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_centro", limit: 45, null: false
  end

  create_table "tb_tipo_de_curso", primary_key: "id_tipo_de_curso", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_curso", limit: 45, null: false
  end

  create_table "tb_tipo_de_documento", primary_key: "id_tipo_de_documento", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_documento", limit: 45, null: false
    t.string "mnemo", limit: 3, null: false
  end

  create_table "tb_tipo_de_material", primary_key: "id_tipo_de_material", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC" do |t|
    t.string "tipo_de_material", limit: 45, null: false
  end

  create_table "tb_tipo_de_misionero", primary_key: "id_tipo_de_misionero", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_misionero", limit: 45, null: false
  end

  create_table "tb_tipo_de_obispo", primary_key: "id_tipo_de_obispo", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_obispo", limit: 45, null: false
    t.date "fecha_desde", null: false
    t.date "fecha_hasta"
    t.integer "tb_causa_de_baja", unsigned: true
  end

  create_table "tb_tipo_de_sancion", primary_key: "id_tipo_de_sancion", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_sancion", limit: 45, null: false
  end

  create_table "tb_tipo_de_santuario", primary_key: "id_tipo_de_santuario", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci" do |t|
    t.string "tipo_de_santuario"
    t.index ["tipo_de_santuario"], name: "tipo", unique: true
  end

  create_table "tb_tipo_de_tarjeta", primary_key: "id_tipo_de_tarjeta", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo_de_tarjeta", limit: 45, null: false
  end

  create_table "tb_ungido", primary_key: "id_ungido", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tb_persona", null: false, unsigned: true
    t.integer "tb_centro0templo_donde_fue_ungido", unsigned: true
    t.string "otro_templo_o_lumisial_donde_fue_ungido", limit: 100
    t.date "fecha_desde"
    t.date "fecha_hasta"
    t.integer "tb_causa_de_baja", unsigned: true
    t.integer "numero_de_curso", unsigned: true
    t.integer "codigo_de_credencial", unsigned: true
    t.string "persona_que_lo_ungio", limit: 70
    t.index ["tb_centro0templo_donde_fue_ungido"], name: "Index_3"
    t.index ["tb_persona"], name: "Index_2"
  end

  create_table "tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "id", null: false, unsigned: true
    t.string "name", null: false
    t.string "apellido", limit: 45
    t.string "email"
    t.string "password", limit: 60
    t.string "remember_token", limit: 100
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string "avatar"
    t.string "network"
    t.string "network_id"
    t.date "fecha_de_nacimiento"
    t.string "celular", limit: 45
    t.string "domicilio", limit: 45
    t.string "localidad", limit: 45
    t.integer "tb_provincia", unsigned: true
    t.string "file_fotografia", limit: 20
    t.integer "tb_persona", unsigned: true
    t.index ["id"], name: "id", unique: true
  end

end
