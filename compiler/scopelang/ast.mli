(* This file is part of the Catala compiler, a specification language for tax
   and social benefits computation rules. Copyright (C) 2020 Inria, contributor:
   Denis Merigoux <denis.merigoux@inria.fr>

   Licensed under the Apache License, Version 2.0 (the "License"); you may not
   use this file except in compliance with the License. You may obtain a copy of
   the License at

   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
   WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
   License for the specific language governing permissions and limitations under
   the License. *)

(** Abstract syntax tree of the scope language *)

open Utils
open Shared_ast

(** {1 Identifiers} *)

type location = scopelang glocation

module LocationSet : Set.S with type elt = location Marked.pos

(** {1 Abstract syntax tree} *)

type 'm expr = (scopelang, 'm mark) gexpr

val locations_used : 'm expr -> LocationSet.t

(** This type characterizes the three levels of visibility for a given scope
    variable with regards to the scope's input and possible redefinitions inside
    the scope.. *)
type io_input =
  | NoInput
      (** For an internal variable defined only in the scope, and does not
          appear in the input. *)
  | OnlyInput
      (** For variables that should not be redefined in the scope, because they
          appear in the input. *)
  | Reentrant
      (** For variables defined in the scope that can also be redefined by the
          caller as they appear in the input. *)

type io = {
  io_output : bool Marked.pos;
      (** [true] is present in the output of the scope. *)
  io_input : io_input Marked.pos;
}
(** Characterization of the input/output status of a scope variable. *)

type 'm rule =
  | Definition of location Marked.pos * typ * io * 'm expr
  | Assertion of 'm expr
  | Call of ScopeName.t * SubScopeName.t * 'm mark

type 'm scope_decl = {
  scope_decl_name : ScopeName.t;
  scope_sig : (typ * io) ScopeVarMap.t;
  scope_decl_rules : 'm rule list;
  scope_mark : 'm mark;
}

type 'm program = {
  program_scopes : 'm scope_decl ScopeMap.t;
  program_ctx : decl_ctx;
}

val type_program : 'm program -> typed program
