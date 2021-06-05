var validateme_external = null;
var submitButton = null;
var buttonText = "Enviar";
!function( $ ) {
	var form_for_facebook_callback = null;
	var validateme = function(form, options) {
		
		this.include_facebook = options.include_facebook;
		this.message = options.message;
		this.validate_me_icon = options.validate_me_icon;
		this.good_icon  = options.good_icon;
		this.wrong_icon = options.wrong_icon;
		this.message = options.message;
		this.callback = options.callback;
		
		var self = this;
		validateme_external = this;
		self.form = $(form);
		
		var send_with = self.form.data("sendwith");
		var call_facebook = self.form.data("facebook");
		
		submitButton = self.form.find("button[type=submit]");
		
		submitButton.attr("type", "button");
		submitButton.click(function(){
			
			self.form.find("div#alert-error").hide(500);
			self.form.find("div#alert-success").show(500);
			
			if (send_with == "ajax"){
					$(this).attr("disabled", true);
			}
			else{
				$("button, a").attr("disabled", true);
			}
			buttonText = $(this).html();
			$(this).empty();
			$(this).append('<img src="/assets/ajax-loader.gif" width="30" />');
			
			var all_form_objects = self.form.find("input, select, textarea");
			
			var is_form_valid = true;
			
			for (var i = 0; i < all_form_objects.length; i++) {
			    object = $(all_form_objects[i]);
					
					if (object.hasClass("validateme")){	
				
						if (self.post_validate_object(object)){
							var input_name = object.attr("name");
							self.mark_as_valid(object);
						}
						else{
							is_form_valid = false;
							self.mark_as_notvalid(object);
						}
					}
			}
			
			if (is_form_valid){
				var params = {};
				if (send_with == "ajax"){
					for (var i = 0; i < all_form_objects.length; i++) {
					   object = $(all_form_objects[i]);
						 var input_name = object.attr("name");
						 params[input_name] = object.val();
					}
					$.post(self.form.attr("action")+".json", params, function(res){
						if (call_facebook == true)
							self.call_facebook_dialog(send_with);
						self.form.find("div#alert-success").append("<p>"+self.form.data("messagesuccess")+"</p>");
						self.form.find("div#alert-success").show(500);
						
						if (self.callback){
							self.callback(res);
							submitButton.empty();
							submitButton.append(buttonText);
							submitButton.attr("disabled", false);
						}
							
					})
					.error(function(res){
						submitButton.empty();
						submitButton.append(buttonText);
						submitButton.attr("disabled", false);
						if (res.status == 500)
							self.form.find("div#alert-error").append("<p>A ocurrido un error inesperado!</p>");
						else
							self.form.find("div#alert-error").append("<p>Revisa tu conexi&oacute;n a internet!</p>");
							
						self.form.find("div#alert-error").show(500);
					});
				}
				else{
					self.form.find("div#alert-success").append("<p>"+self.form.data("messagesuccess")+"</p>");
					self.form.find("div#alert-success").show(500);
					
					if (call_facebook == true)
						self.call_facebook_dialog(send_with);
					else
						form.submit();
				}
			}
			else{
				submitButton.empty();
				submitButton.append(buttonText);
				$("button, a").attr("disabled", false);
				self.form.find("div#alert-error").append("<p>Error en el formulario, revisa los campos.</p>");
				self.form.find("div#alert-error").show(500);
			}
			
		});
		
		var form_objects = self.form.find("input, select, textarea");
		
		form_objects.each(function(){
			var form_object = $(this);
			self.bootstrapClases(form_object, true);
			form_object.blur(function(){
				self.manage_object(form_object);
			});
		});
	};

	validateme.prototype = {
		constructor: validateme,
		
		resetForm: function(){
			
			submitButton.empty();
			submitButton.append(buttonText);
			submitButton.attr("disabled", false);
			var all_form_objects = this.form.find("input, select, textarea");
			
			for (var i = 0; i < all_form_objects.length; i++) {
			    object = $(all_form_objects[i]);
					object.val("");
					object.attr("checked", false);
					
					if (object.hasClass("validateme")){	
						this.mark_as_normal(object);
						
					}
			}
		},
		
		call_facebook_dialog: function(send_with){
			var fb_ids = $.parseJSON(this.form.find("input#fb-users-ids").val());
			form_for_facebook_callback = this.form;
			if (send_with == "ajax"){
				if (fb_ids.length > 0){
					this.resetForm();
					Facebook.apprequest("Te han invitado a un equipo en yogofutbol.com!", fb_ids, this.facebook_callback_ajax);
				}
				else{
					this.resetForm();
					form_for_facebook_callback.submit();
				}
			}
			else{
				if (fb_ids.length > 0)
					Facebook.apprequest("Te han invitado a un equipo en yogofutbol.com!", fb_ids, this.facebook_callback_html);
				else
					form_for_facebook_callback.submit();
			}
		},
		
		facebook_callback_html: function(response){
			var form = form_for_facebook_callback;
			form_for_facebook_callback = null;
			if(response && response.request) {
				console.log("Se envio a FB");
				var fb_ids_good = response.to;
				var fb_ids = $.parseJSON(form.find("input#fb-users-ids").val());
				
				for (var i = 0; i < fb_ids_good.length; i++){
					fb_ids = $.grep(fb_ids, function(value) {
					  return value != fb_ids_good[i];
					});
				}
				
				if (fb_ids.length > 0){
					//Sacar dialog de invitacion de amistad, ya que esas personas no son amigas de el actualmente.
					form.submit();
				}
				else{
					form.submit();
				}
				
	      
	    } else {
	      console.log("FB cancelado por el usuario");
				form.submit();
	    }
		},
		
		facebook_callback_ajax: function(response){
			var form = form_for_facebook_callback;
			form_for_facebook_callback = null;
			
			if(response && response.request) {
				// var fb_ids_good = response.to;
// 				var fb_ids = $.parseJSON(form.find("input#fb-users-ids").val());
// 				
// 				for (var i = 0; i < fb_ids_good.length; i++){
// 					fb_ids = $.grep(fb_ids, function(value) {
// 					  return value != fb_ids_good[i];
// 					});
// 				}
// 				
// 				if (fb_ids.length > 0){
// 					//Sacar dialog de invitacion de amistad, ya que esas personas no son amigas de el actualmente.
// 				}
// 				else{
// 				}
				console.log("Requests sended");
				
	      
	    } else {
				console.log("FB cancelado por el usuairo");
	    }
		},

		bootstrapClases: function(object, show_asterisk){
			if (object.hasClass("validateme")){
				object.parent().addClass("input-group");
				object.parent().addClass("form-group");
				object.parent().addClass("has-feedback");
				object.addClass("form-control");
				object.css({
					"margin-top": "1px"
				});
				
				var message = object.data("message");
				
				if (message == undefined || message == "" || message == null){
					message = this.message;
				}
				
				if (show_asterisk)
					object.before('<span class="input-group-addon '+this.validate_me_icon+'"></span>');
					
				object.after('<span class="input-group-addon form-control-feedback '+this.good_icon+'" id="good"></span>');
				object.after('<span class="input-group-addon form-control-feedback '+this.wrong_icon+'" id="wrong" data-toggle="tooltip" data-placement="top" title="'+message+'"></span>');
				object.siblings("span#good, span#wrong").hide();
				object.siblings("span#good, span#wrong").tooltip({
					items: "[content], [title]",
					html: true,
					content: function() {
							return $(this).attr("content");
						}
				});
			}
		},
		manage_object: function(object){
			if (object.hasClass("validateme")){
			
				object.data("valid", "0");
				
				this.validate_object(object);
			}
		},
		validate_object: function(object){
			var must_apivalidate = object.data("apivalidator");
			if (must_apivalidate != undefined && must_apivalidate != ""){
				if (object.val() == "" || object.val() == null){
					this.mark_as_notvalid(object);
				}
				else{
					this.mark_as_valid(object);
					this.validate_with_api(object);
				}
			}
			else{
				if (object.val() == "" || object.val() == null || object.val() == 0 || object.val() == "0"){
					this.mark_as_notvalid(object);
				}
				else{
					this.mark_as_valid(object);
				}
			}
		},
		
		post_validate_object: function(object){

			if (object.val() == "" || object.val() == null || object.val() == 0 || object.val() == "0"){
				this.mark_as_notvalid(object);
				return false;
			}
			else{
				this.mark_as_valid(object);
				return true;
			}
			
		},
		
		mark_as_valid: function(object){
			object.data("valid", "1");
			object.parent().addClass("has-success");
			object.parent().removeClass("has-error");
			object.siblings("span#good").show();
			object.siblings("span#wrong").hide();
		},
		mark_as_notvalid: function(object){
			object.data("valid", "0");
			object.parent().addClass("has-error");
			object.parent().removeClass("has-success");
			object.siblings("span#good").hide();
			object.siblings("span#wrong").show();
			return;
		},
		
		mark_as_normal: function(object){
			object.data("valid", "0");
			object.parent().removeClass("has-error");
			object.parent().removeClass("has-success");
			object.siblings("span#good").hide();
			object.siblings("span#wrong").hide();
		},
		
		validate_with_api: function(object){
			var self = this;
			var url = object.data("apivalidator");
			$.get(url, function(res){
				self.mark_as_valid(object);
			})
			.error(function(res){
				if (res.message != "" && res.message != null && res.message != undefined)
					form_object.siblings("span#wrong").attr("title", res.message);
					
				self.mark_as_notvalid(object);
			});
		}
	};

	$.fn.validateme = function ( option, val ) {
		return this.each(function () {
			var $this = $(this),
				data = $this.data('validateme'),
				options = typeof option === 'object' && option;
			if (!data)  {
				$this.data('validateme', (data = new validateme(this, $.extend({}, $.fn.validateme.defaults,options))));
			}
			if (typeof option == 'string') {
				data[option](val);
			}
		})
	};

	$.fn.validateme.defaults = {
		include_facebook: true,
		message: "Este campo es obligatorio",
		validate_me_icon: "glyphicon glyphicon-asterisk",
		good_icon: "glyphicon glyphicon-ok",
		wrong_icon: "glyphicon glyphicon-warning-sign",
		field_error_message: "Este campo es obligatorio!",
		callback: null
	};

	$.fn.validateme.Constructor = validateme;

}( window.jQuery );

$.fn.validatemeTo = function(){
	var object = $(this);
	
	validateme_external.bootstrapClases(object, false);
	object.blur(function(){
		console.log(1);
		validateme_external.manage_object(object);
	});

};