(function () {
    var module = angular.module('level-module', []);
    module.controller('LevelController', ['$http', '$scope', '$sce', function ($http, $scope, $sce) {
        var self = this;

        $("#content").css({
            "background-color": "#333"
        });

        this.game = {
            warrior: null,
            level: null,
            code: null,
            log: $sce.trustAsHtml("<p>Escribe tu Codigo, aca ver&aacute;s las acciones realizadas por cada turno...</p>")
        };

        this.warriorPivot = 0;

        this.gameOver = false;
        this.levelClear = false;
        this.alert = {
            show: false,
            title: null,
            msg: null
        }
        this.readingCode = false;

        this.playBtn = "Jugar";

        this.damageFromShoot = false;


        this.initVariables = function (level, warrior, game_warrior) {
            this.game.warrior = game_warrior;
            this.warrior = warrior
            this.game.level = level;
            var myCodeMirror = CodeMirror.fromTextArea(document.getElementById("codemirror"), {
                lineNumbers: true,
                mode: "ruby",
                theme: "3024-night"
            });
            this.game.code = myCodeMirror.getValue();

            myCodeMirror.on("changes", function (e, object) {
                $scope.$apply(function () {
                    self.game.code = e.getValue();
                });
            });

            this.initGameScene();

        };

        this.getSquareSize = function () {
            var gameSceneWidth = $("#game").width();

            var rowFloorWidth = gameSceneWidth;

            var wallWidth = rowFloorWidth / (self.game.level.size_width + 2);
            var wallHeight = (wallWidth * 211) / 101;

            return {
                width: wallWidth,
                height: wallHeight
            };
        };

        this.initGameScene = function () {


            var height = $(window).height();
            $("#game").css({
                height: height + "px"
            });

            var gameSceneWidth = $("#game").width();

            var rowFloorWidth = gameSceneWidth;

            var wallWidth = rowFloorWidth / (self.game.level.size_width + 2);
            var wallHeight = (wallWidth * 211) / 101;

            rowFloorHeight = wallHeight;

            var gameSceneHeight = rowFloorHeight * self.game.level.size_height - (self.game.level.size_height * (wallHeight * 0.4) + (wallHeight * 0.10));

            $("#game-scene").css({
                height: gameSceneHeight + "px"
            });

            $(".wall, .floor, .stairs").each(function () {
                var wall = $(this);

                var extra_y = (wallHeight * 0.4) + ((wallHeight * 0.10) * wall.data("y"));

                var wallPos = {
                    x: wall.data("x") * wallWidth,
                    y: (wall.data("y") * wallWidth) - extra_y
                };

                wall.css({
                    width: wallWidth + "px",
                    height: wallHeight + "px",
                    top: wallPos.y + "px",
                    left: wallPos.x + "px"
                });

            });


        };

        this.setUnitsReady = function (object) {
            var gameSceneWidth = $("#game").width();

            var rowFloorWidth = gameSceneWidth;

            var wallWidth = rowFloorWidth / (self.game.level.size_width + 2);
            var wallHeight = (wallWidth * 211) / 101;

            for (var i = 0; i < this.game.level.rubywarrior_tower_units.length; i++) {
                var unit = this.game.level.rubywarrior_tower_units[i];

                var extra_y = (wallHeight * 0.15);

                var unitPos = {
                    x: (unit.pos_x + 1) * wallWidth,
                    y: (unit.pos_y * wallWidth) + extra_y
                };

                $("#unit-" + unit.id).css({
                    width: wallWidth + "px",
                    height: wallHeight + "px",
                    top: unitPos.y + "px",
                    left: unitPos.x + "px"
                });

                unit.pos_x = unitPos.x;
                unit.pos_y = unitPos.y;

            }


        };

        this.setWarriorReady = function (x, y) {

            var gameSceneWidth = $("#game").width();

            var rowFloorWidth = gameSceneWidth;

            var wallWidth = rowFloorWidth / (self.game.level.size_width + 2);
            var wallHeight = (wallWidth * 211) / 101;

            $(".warrior").each(function () {
                var warrior = $(this);

                var extra_y = (wallHeight * 0.15);

                var warriorPos = {
                    x: x * wallWidth,
                    y: (y * wallWidth) + extra_y
                };
                warrior.css({
                    width: wallWidth + "px",
                    height: wallHeight + "px",
                    top: warriorPos.y + "px",
                    left: warriorPos.x + "px"
                });

                self.game.warrior.pos_x = warriorPos.x;
                self.game.warrior.pos_y = warriorPos.y;
            });
        };

        this.runGame = function (game) {

            if (game === 1000) {
                this.gameOver = true;
                console.log("Infinity Loop");
                this.alert.title = "GAME OVER";
                this.alert.msg = "No pudiste completar el nivel!"
                this.alert.show = true;
                this.playBtn = "Ejecutado!";
                return;
            }

            var actions = 0;
            var turns = game.length;
            var turn = 0;
            var action = 0;

            for (var i = 0; i < turns; i++) {
                actions += game[i].voices.length;
            }

            console.log("TURN: 0");

            var gameLoop = setInterval(function () {

                var turn_actions = game[turn].voices.length;

                if (action >= turn_actions) {
                    console.log("TURN: " + turn);
                    turn++;
                    action = 0;
                } else {

                    self.doAction(game[turn].voices[action]);
                    console.log("ACTION: " + action + " -> " + game[turn].voices[action].message);
                    $("#game-log").prepend("<p>Turn: " + turn + " -> " + game[turn].voices[action].message + "</p>");

                    action++;
                }

                if (turn >= turns) {
                    console.log("GAME OVER WIN?");
                    $scope.$apply(function () {
                        if (self.gameOver === false) {
                            self.alert.title = "NIVEL COMPLETADO!!";
                            self.alert.msg = "Excelente, da click en continuar y continua tu aventura!"
                            self.alert.show = true;
                            self.levelClear = true;
                            self.playBtn = "Ejecutado!";
                        }

                    });
                    clearInterval(gameLoop);
                    return;
                }

            }, 1000);
        };

        this.doAction = function (voice) {
            var action_array = voice.action.split("-");
            var action = action_array[0];
            var direction = action_array[1];

            if (action === "walk") {
                this.walk(this.getUnit(voice.id, voice.code), direction);
            } else if (action === "walkfail") {
                this.walkFail(this.getUnit(voice.id, voice.code), direction);
            } else if (action === "dead") {
                this.dies(this.getUnit(voice.id, voice.code));
            } else if (action === "attack") {
                this.attack(this.getUnit(voice.id, voice.code), direction);
            } else if (action === "rest") {
                this.rest(this.getUnit(voice.id, voice.code));
            } else if (action === "damage") {
                if (this.damageFromShoot === true){
                    this.damageFromShoot = false;
                    var unit = this.getUnit(voice.id, voice.code);
                    this.shoot(this.getUnit(1, this.warrior.name), unit);
                }
            } else if (action === "shoot") {
                var unit = this.getUnit(voice.id, voice.code);
                if (unit.type === "warrior") {
                    this.damageFromShoot = true;
                } else {
                    this.shoot(unit, this.getUnit(1, this.warrior.name));
                }
            } else if (action === "pivot"){
                this.pivot(this.getUnit(voice.id, voice.code));
            } else if (action === "rescue"){
                this.rescue(this.getUnit(voice.id, voice.code));
            } else if (action === "unbind"){
                this.unbind(this.getUnit(voice.id, voice.code));
            }
        };

        this.getUnit = function (id, code) {
            if (code == this.warrior.name) {
                return {
                    ui: $("#warrior"),
                    object: this.game.warrior,
                    type: "warrior"
                };
            } else {
                var unit;
                for (var i = 0; i < this.game.level.rubywarrior_tower_units.length; i++) {
                    if (id === this.game.level.rubywarrior_tower_units[i].id) {
                        unit = this.game.level.rubywarrior_tower_units[i];
                        break;
                    }
                }

                return {
                    ui: $("#unit-" + id),
                    object: unit,
                    type: "other"
                }
            }
        };

        this.walk = function (unit, direction) {
            var orientation = unit.object.direction;
            var squareSize = this.getSquareSize();

            var newX;
            var newY;

            if (this.warriorPivot === 1){
                squareSize.height = squareSize.height * -1;
                squareSize.width = squareSize.width * -1;
            }

            if (direction === "backward") {
                squareSize.height = squareSize.height * -1;
                squareSize.width = squareSize.width * -1;
            }

            if (orientation === 0) {
                newX = unit.object.pos_x;
                newY = unit.object.pos_y - squareSize.height;
            } else if (orientation === 1) {
                newX = unit.object.pos_x + squareSize.width;
                newY = unit.object.pos_y;
            } else if (orientation === 2) {
                newX = unit.object.pos_x;
                newY = unit.object.pos_y + squareSize.height;
            } else {
                newX = unit.object.pos_x - squareSize.width;
                newY = unit.object.pos_y;
            }

            unit.object.pos_x = newX;
            unit.object.pos_y = newY;

            unit.ui.animate({
                top: newY,
                left: newX
            }, 1000);
        };

        this.walkFail = function (unit, direction) {
            var orientation = unit.object.direction;
            var squareSize = this.getSquareSize();

            var newX;
            var newY;

            if (direction != "backward") {
                squareSize.height = squareSize.height * -1;
                squareSize.width = squareSize.width * -1;
            }

            if (orientation === 0) {
                newX = unit.object.pos_x;
                newY = unit.object.pos_y - squareSize.height;
            } else if (orientation === 1) {
                newX = unit.object.pos_x + squareSize.width;
                newY = unit.object.pos_y;
            } else if (orientation === 2) {
                newX = unit.object.pos_x;
                newY = unit.object.pos_y + squareSize.height;
            } else {
                newX = unit.object.pos_x - squareSize.width;
                newY = unit.object.pos_y;
            }

            unit.object.pos_x = newX;
            unit.object.pos_y = newY;

            unit.ui.animate({
                top: newY,
                left: newX
            }, 1000);
        };

        this.dies = function (unit) {
            if (unit.type === "warrior") {
                $scope.$apply(function () {
                    self.alert.title = "GAME OVER";
                    self.alert.msg = "No pudiste completar el nivel!"
                    self.alert.show = true;
                    self.gameOver = true;
                    self.playBtn = "Ejecutado!";
                });
            }
            else if(unit.object.name === "captive"){
                $scope.$apply(function () {
                    self.alert.title = "GAME OVER";
                    self.alert.msg = "No pudiste completar el nivel! Mataste a un Cautivo"
                    self.alert.show = true;
                    self.gameOver = true;
                    self.playBtn = "Ejecutado!";
                });
            }
            unit.ui.fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).hide(100);
        };

        this.attack = function (unit, direction) {
            var orientation = unit.object.direction;
            var squareSize = this.getSquareSize();

            var newX;
            var newY;

            if (this.warriorPivot === 1 && unit.type === "warrior"){
                squareSize.height = squareSize.height * -1;
                squareSize.width = squareSize.width * -1;
            }

            if (direction === "backward") {
                squareSize.height = squareSize.height * -1;
                squareSize.width = squareSize.width * -1;
            }

            if (orientation === 0) {
                newX = unit.object.pos_x;
                newY = unit.object.pos_y - squareSize.height / 2;
            } else if (orientation === 1) {
                newX = unit.object.pos_x + squareSize.width / 2;
                newY = unit.object.pos_y;
            } else if (orientation === 2) {
                newX = unit.object.pos_x;
                newY = unit.object.pos_y + squareSize.height / 2;
            } else {
                newX = unit.object.pos_x - squareSize.width / 2;
                newY = unit.object.pos_y;
            }

            unit.ui.animate({
                top: newY,
                left: newX
            }, 250, function () {
                $("#attack-effect").css({
                    top: newY,
                    left: newX
                });
                $("#attack-effect").fadeIn(100).fadeOut(100);
                unit.ui.animate({
                    top: unit.object.pos_y,
                    left: unit.object.pos_x
                }, 250);
            });
        };

        this.bind = function () {};

        this.unbind = function(unit){
            unit.ui.fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).hide(100);
        };

        this.detonate = function () {};

        this.explode = function () {};

        this.form = function () {};

        this.pivot = function (unit) {
            if (this.warriorPivot === 1) {
                $scope.$apply(function () {
                    self.warriorPivot = 0;
                });
            } else {
                $scope.$apply(function () {
                    self.warriorPivot = 1;
                });
            }
        };

        this.rescue = function (unit) {
            $("#rescue-effect").css({
                left: unit.object.pos_x,
                top: unit.object.pos_y
            });

            $("#rescue-effect").fadeIn(100).delay(150).fadeOut(250);
        };

        this.rest = function (unit) {

            $("#rest-effect").css({
                left: unit.object.pos_x,
                top: unit.object.pos_y
            });

            $("#rest-effect").fadeIn(100).delay(150).fadeOut(250);

        };

        this.shoot = function (unit, target) {
            var orientation = unit.object.direction;
            if (orientation === 1 && unit.type === "warrior" && this.warriorPivot === 1) {
                orientation = 3;
            } else if (orientation === 3 && unit.type === "warrior" && this.warriorPivot === 1) {
                orientation = 1;
            }

            $("#shoot-effect"+orientation).css({
                left: target.object.pos_x,
                top: target.object.pos_y
            });

            $("#bow-effect"+orientation).css({
                left: unit.object.pos_x,
                top: unit.object.pos_y
            });

            $("#shoot-effect"+orientation).fadeIn(100).delay(250).fadeOut(250);
            $("#bow-effect"+orientation).fadeIn(100).delay(250).fadeOut(250);
        };

        this.play = function () {

            if (this.readingCode === true) {
                console.log("codigo ya enviado");
                return;
            }

            if (this.gameOver === true || this.levelClear === true) {
                console.log("Nivel perdido");
                this.alert.title = "GAME OVER";
                this.alert.msg = "No pudiste completar el nivel!"
                this.alert.show = true;
                return;
            }
            this.readingCode = true;
            this.playBtn = "Ejecutando...";
            var params = {
                warrior_id: this.warrior.id,
                level_id: this.game.level.id,
                code: this.game.code
            }

            $http.post('/rubywarrior/api/v1/game/run.json', params)
                .success(function (data, status, headers, config) {
                console.log(data);
                //self.readingCode = false;
                self.runGame(data.game);
            })
                .error(function (data, status, headers, config) {
                //self.readingCode = false;
                self.alert.title = "GAME OVER";
                self.alert.msg = "Hay un error gramático en tu código!"
                self.alert.show = true;
                self.gameOver = true;
                self.playBtn = "Ejecutado!";
            });
        };

        this.repeat = function () {
            console.log("REPEAT");
            this.alert.title = "GAME OVER";
            this.alert.msg = "Recargando nivel, espera por favor!"
            this.alert.show = true;
            this.playBtn = "Ejecutado!";
            location.reload();
        }


    }]);
})();