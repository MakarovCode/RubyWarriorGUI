
var CodigoEs = new Object();

CodigoEs.init = function(){
    
    $('[data-toggle="tooltip"]').tooltip();

	$('.menu .item').tab();

	$("button.show-contact").hover(
		function(){
			$(this).html('Contacto <i class="glyphicon glyphicon-envelope"></i>');
		},
		function(){
			$(this).html('<i class="glyphicon glyphicon-envelope"></i>');
		}
	);	
    
	console.log("CodigoEs Init");
	$("textarea.editor, .forem-cont textarea").each(function(){
		CKEDITOR.replace($(this).attr("id"), {
			language: 'es'
		});
	
		for (var i in CKEDITOR.instances) {
	      CKEDITOR.instances[i].on('change', function() {
					var data = CKEDITOR.instances[this.name].getData();
					$("#"+this.name).val(data);
	      });
	  }
	});
	
	$("pre").snippet("ruby",{style:"golden",transparent:false,showNum:true});
}

CodigoEs.tutorialShow = function(){
	console.log("CodigoEs Tutorial Show");
	
	$("#tutorial-comments").css("height", $(window).height() - 50);
	$("button.show-comments").hover(
		function(){
			$(this).html('Comentarios <i class="glyphicon glyphicon-tasks"></i>');
		},
		function(){
			$(this).html('<i class="glyphicon glyphicon-tasks"></i>');
		}
	);
	
	$("button.show-comments").click(function(){
		console.log("Comments Toogle");
		$("#tutorial-comments, #hide-comments, #write-comment-up").toggle(500);
	});

	$("button.show-two-comments").click(function(){
		console.log("Comments Toogle");
		$("#tutorial-comments, #hide-comments, #write-comment-up").toggle(500);
	});
	
	
}

CodigoEs.comment = function(){
	$("#comment_form").validateme({
		callback: function(res){

			// $('.modal.write').modal('show')
 			// .modal('attach events', '.test.button', 'show');

			$("#write-comment-modal").modal("hide");
			var html = '<div class="comments-container" id="comment-'+res.id+'">'+
									'<div class="media">'+
									  '<a class="pull-left" href="#">'+
											'<img src="/assets/profile.jpg" class="media-object" />'+
									  '</a>'+
									  '<div class="media-body to-white">'+
									    '<h4 class="media-heading">'+res.username+' dice:</h4>'+
											'<p id="description">'+
									   	 res.comment+
											'</p>'+
									    '<br />'+
									     '<div class="btn-group pull-right">'+
									     	'<button class="btn btn-link btn-sm btn-lg" data-toggle="modal" data-target="#modal_comment_'+res.id+'"> Editar </button>'+
									     '</div>'+
									  '</div>'+
									'</div>'+
								 '</div>'+
								'<br />';
					var modal =	'<div class="modal fade" id="modal_comment_'+res.id+'" tabindex="-1" role="dialog" aria-labelledby="modal_comment_'+res.id+'-label" aria-hidden="true">'+
									'<form accept-charset="UTF-8" action="/comments/'+res.id+'" class="edit_tutorial_comment" data-facebook="false" data-messagesuccess="Comentario editado correctamente!" data-sendwith="ajax" id="comment_form_'+res.id+'" method="put">'+
										'<div class="modal-dialog">'+
											'<div class="modal-content">'+
												'<div class="modal-header">'+
													'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'+
													'<h4 class="modal-title" id="modal_comment_'+res.id+'-label">Editar Comentario</h4>'+
												'</div>'+
												'<div class="modal-body">'+
													'<label>Tu comentario</label>'+
													'<textarea name="comment[description]" id="text-'+res.id+'" class="editor"> '+res.comment+' </textarea>'+
													'<input type="hidden" name="comment[id]" value="'+res.id+'">'+
													'<input type="hidden" name="_method" value="PUT">'+
												'</div>'+
												'<div class="modal-footer">'+
													'<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>'+
													'<button type="submit" class="btn btn-primary">Guardar Cambios</button>'+
												'</div>'+
											'</div>'+
										'</div>'+
									'</form>';
			$("div#append-comment-next-to").after(html);
			$("div#modal_ajax_edit").append(modal);
			$('#comment_form_'+res.id).validateme({
				callback: function(res){
					var justModal = $('#modal_comment_'+res.id);
					justModal.modal("hide");
					$("#comment-"+res.id).find("p#description").empty();
					$("#comment-"+res.id).find("p#description").html(res.comment);
				}
			});
			CKEDITOR.replace('text-'+res.id, {
				language: 'es'
			});
	
			for (var i in CKEDITOR.instances) {
		      CKEDITOR.instances[i].on('change', function() {
						var data = CKEDITOR.instances[this.name].getData();
						$("#"+this.name).val(data);
		      });
		  }

		}
	});
}

CodigoEs.edit_comment = function(form, modal, id){
	$(form).validateme({
		callback: function(res){
			// $('.modal').modal('show');

			$(modal).modal("hide");
			$("#comment-"+id).find("p#description").empty();
			$("#comment-"+id).find("p#description").html(res.comment);
			//$("div#tutorial-comments").append(html);
		}
	});
}