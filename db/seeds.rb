
   category = Category.create([{ name: 'Ruby On Rails', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' }, 
   	{ name: 'Javascript', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'},
   	{ name: 'Jquery', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'},
   	{ name: 'Heroku', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'},
   	{ name: 'CSS3', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'},
   	{ name: 'GIT', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'},
   	{ name: 'HTML', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'},
   	{ name: 'GEMA Active Admin', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'},
   	{ name: 'GEMA Device', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'},
   	{ name: 'Login Facebook', description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'}
   	])
    
    #NIVEL 1
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 0, pos_y: 0, direction: 1, habilities: "walk!"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 1", description: "Tienes ante ti un gran corredor con unas escaleras al final y por suerte para ti, no hay nada en tu camino hacia ellas", 
       tip: "Llama <code>warrior.walk!</code> <trans>(Guerrero Camina!)</trans> para caminar hacia adelante, en <code>Player</code> dentro del método <code>play_turn</code> <trans>(Turno de Juego)</trans>.",
       clue: "Que clase de ayudas esperabas?, adelante camina, aún hay un largo camino a la cima",
       size_width: 8, size_height: 1, stairs_x: 7, 
       stairs_y: 0, time_bonus: 15, ace_score: 10, rubywarrior_tower_warrior_id: 1
    )
    
    #NIVEL 2
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 0, pos_y: 0, direction: 1, habilities: "walk!,feel,attack!"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 2", description: "Está oscuro y tu visión es poca, pero puedes oler un hedor proveniente de la oscuridad.", 
       tip: "Utiliza <code>warrior.feel.empty?</code> <trans>(Guerrero sientes algo?)</trans> para ve si hay algo enfrente de ti, <code>warrior.attack!</code> <trans>(Guerrero Ataca!)</trans> para combatirlo. Recuerda, solo puedes utilizar una accion <code>(terminada en !)</code> por turno.",
       clue: "Utiliza una condicion <code>if/else</code> usando el <code>warrior.feel.empty?</code> para decidir cuando el warrior <trans>(Guerrero)</trans> debe <code>warrior.walk!</code> <trans>(Guerrero Camina!)</trans> o debe <code>warrior.attack!</code> <trans>(Guerrero Ataca!)</trans>",
       size_width: 8, size_height: 1, stairs_x: 7, 
       stairs_y: 0, time_bonus: 20, ace_score: 26, rubywarrior_tower_warrior_id: warrior.id
    )
    
    units = RubywarriorTowerUnit.create(
      {name: "sludge", pos_x: 4, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id}
    )
    
    #NIVEL 3
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 0, pos_y: 0, direction: 1, habilities: "walk!,health,rest!,feel,attack!"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 3", description: "El aire se siente mas denso que antes, el hedor debe es insoportable.", 
       tip: "Ten ciudado y no mueras!, utiliza <code>warrior.health?</code> <trans>(Vida del Guerrero?)</trans> para vigilar tu salud, y <code>warrior.rest!</code> <trans>(Guerrero Descanza!)</trans> para recuperar un 10% de tu vida total.",
       clue: "Cuando no hallan enemigos delante de ti, llama <code>warrior.rest!</code> <trans>(Vida del Guerrero)</trans> hasta que tu salud total este devuelta.",
       size_width: 9, size_height: 1, stairs_x: 8, 
       stairs_y: 0, time_bonus: 35, ace_score: 71, rubywarrior_tower_warrior_id: warrior.id
    )
    
    units = RubywarriorTowerUnit.create([
      {name: "sludge", pos_x: 2, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "sludge", pos_x: 4, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "sludge", pos_x: 5, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "sludge", pos_x: 7, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id}
    ])
    
    #NIVEL 4
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 0, pos_y: 0, direction: 1, habilities: "walk!,health,rest!,feel,attack!"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 4", description: "En la lejanía puedes escuchar los Arcos estirarse!.", 
       tip: "Esta vez no hay nuevas habilidades, pero debes tener cuidado de no descanzar mientras esta siendo atacado, guarda una variable de <code>instancia</code> <code>@health</code> <trans>(Vida)</trans> y comparala con tu vida en cada turno para saber si estas siendo atacado.",
       clue: "Coloca la variable de instancia <code>@health</code> al final del turno, si ésta es mayor a tu vida actual entonces sabes que estas siendo atacado y no debes descanzar.",
       size_width: 7, size_height: 1, stairs_x: 6, 
       stairs_y: 0, time_bonus: 45, ace_score: 90, rubywarrior_tower_warrior_id: warrior.id
    )
    
    units = RubywarriorTowerUnit.create([
      {name: "thick_sludge", pos_x: 2, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "archer", pos_x: 3, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "thick_sludge", pos_x: 5, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id}
    ])
    
    #NIVEL 5
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 0, pos_y: 0, direction: 1, habilities: "walk!,health,rest!,feel,rescue!"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 5", description: "Escuchas llanos de ayuda. Los cautivos necesitan ser rescatados.", 
       tip: "Use <code>warrior.feel.captive?</code> <trans>(Guerrero sientes a algun cautivo?)</trans> para ver si hay algun capturado, y <code>warrior.recure!</code> <trans>(Guerrero Rescata!)</trans>. No ataques a los cautivos.",
       clue: "No te olvides de estar mirando constante mente si estas siendo atacado, Descanza hasta que tu vida se recupere por completo, si no estás siendo atacado.",
       size_width: 7, size_height: 1, stairs_x: 6, 
       stairs_y: 0, time_bonus: 45, ace_score: 123, rubywarrior_tower_warrior_id: warrior.id
    )
    
    units = RubywarriorTowerUnit.create([
      {name: "captive", pos_x: 2, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "archer", pos_x: 3, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "archer", pos_x: 4, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "thick_sludge", pos_x: 5, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "captive", pos_x: 6, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id}
    ])
    
    #NIVEL 6
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 2, pos_y: 0, direction: 1, habilities: "walk!,health,rest!,feel,rescue!,attack!"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 6", description: "La pared dentras tuyo se siente un poco mas lejos y escuchas llanos de ayuda.", 
       tip: "Puedes caminar hacia atrás pasandole <code>:backward</code> <trans>(Hacia atrás)</trans> como algumento a <code>walk!</code>, y lo mismo funiona para <code>feel</code>, <code>rescue!</code> y <code>attack!</code>. Los arqueros tienen un rango máximo de ataque.",
       clue: "Camina hacia atrás si estas siendo atacado de lejos y no tienes suficiente vida para atacar. Tambien deberías considerar caminar hacia atrás hasta que <code>warrior.feel(:backward).wall?</code> <trans>(Guerrero sientes atrás la pared?)</trans>.",
       size_width: 7, size_height: 1, stairs_x: 6, 
       stairs_y: 0, time_bonus: 55, ace_score: 105, rubywarrior_tower_warrior_id: warrior.id
    )
    
    units = RubywarriorTowerUnit.create([
      {name: "captive", pos_x: 2, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "thick_sludge", pos_x: 4, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "archer", pos_x: 6, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "archer", pos_x: 7, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id}
    ])
    
    #NIVEL 7
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 5, pos_y: 0, direction: 1, habilities: "walk!,health,rest!,feel,rescue!,pivot!,attack!"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 7", description: "Sientes que tienes una pared en frente y una abertura detrás tuyo.", 
       tip: "No eres muy efectivo atacando hacia atrás. Utiliza <code>warrior.feel.wall?</code> <trans>(Guerrero sientes la pared)</trans> y <code>warrior.pivot!</code> (Guerrero cambia tu dirección) para voltearte.",
       clue: "",
       size_width: 6, size_height: 1, stairs_x: 0, 
       stairs_y: 0, time_bonus: 30, ace_score: 50, rubywarrior_tower_warrior_id: warrior.id
    )
    
    units = RubywarriorTowerUnit.create([
      {name: "archer", pos_x: 1, pos_y: 0, direction: 1, rubywarrior_tower_id: tower.id},
      {name: "thick_sludge", pos_x: 3, pos_y: 0, direction: 1, rubywarrior_tower_id: tower.id}
    ])
    
    #NIVEL 8
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 0, pos_y: 0, direction: 1, habilities: "walk!,health,rest!,rescue!,pivot!,look,shoot!"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 8", description: "Escuchas el murmullo de los magos, Cuidate de sus mortiferaz varitas! Suerte tuya que encontraste un arco.", 
       tip: "Utiliza <code>warrior.look</code> <trans>(Guerrero Objserva)</trans> para determinar tu entorno, y <code>warrior.shoot!</code> <trans>(Guerrero Dispara!) para disparar una flecha.</trans>",
       clue: "Los magos son mortales pero tiene poca vida, Matalos antes de que tenga tiempo de atacarte",
       size_width: 6, size_height: 1, stairs_x: 0, 
       stairs_y: 5, time_bonus: 20, ace_score: 46, rubywarrior_tower_warrior_id: warrior.id
    )
    
    units = RubywarriorTowerUnit.create([
      {name: "captive", pos_x: 2, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "wizard", pos_x: 3, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "wizard", pos_x: 4, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id}
    ])
    
    #NIVEL 9
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 5, pos_y: 0, direction: 1, habilities: "walk!,health,rest!,rescue!,pivot!,look,shoot!"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 9", description: "Tiempo de pulir tus habilidades y utilizar todo lo que haz aprendido", 
       tip: "Quida tu espalda!",
       clue: "No sigas disparando el arco mientras estas siendo atacado por la espalda.",
       size_width: 11, size_height: 1, stairs_x: 0, 
       stairs_y: 0, time_bonus: 40, ace_score: 100, rubywarrior_tower_warrior_id: warrior.id
    )
    
    units = RubywarriorTowerUnit.create([
      {name: "captive", pos_x: 1, pos_y: 0, direction: 1, rubywarrior_tower_id: tower.id},
      {name: "archer", pos_x: 2, pos_y: 0, direction: 1, rubywarrior_tower_id: tower.id},
      {name: "thick_sludge", pos_x: 7, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "wizard", pos_x: 9, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
      {name: "captive", pos_x: 10, pos_y: 0, direction: 3, rubywarrior_tower_id: tower.id},
    ])
    
    #NIVEL 10
    warrior = RubywarriorTowerWarrior.create(
      pos_x: 0, pos_y: 1, direction: 1, habilities: "walk!,health,rest!,rescue!,pivot!,look,shoot!,direction_of_stairs"
    )
    
    tower = RubywarriorTower.create(
       name: "Nivel 9", description: "Todo esta en silencio, la habitación parece más grande, por suerte tienes un mapa hacia las escaleras!", 
       tip: "Utiliza <code>warrior.direction_of_stairs</code> <trans>(Guerrero en que dirección están las escaleras)</trans> y pasale el resultado como parametro a <code>warrior.walk!</code> para caminar en esa dirección.",
       clue: "",
       size_width: 6, size_height: 4, stairs_x: 2, 
       stairs_y: 3, time_bonus: 20, ace_score: 19, rubywarrior_tower_warrior_id: warrior.id
    )
    
    #NIVEL 11
    
    #NIVEL 12
    
    #NIVEL 13
    
    #NIVEL 14
    
    #NIVEL 15
    
    #NIVEL 16
    
    #NIVEL 17
    
    #NIVEL 18
    
