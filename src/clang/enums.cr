module Clang
  enum VisitResult
    Break
    Continue
    Recurse
  end

  struct Cursor
    enum Kind
      UnexposedDecl                      =  1
      StructDecl                         =  2
      UnionDecl                          =  3
      ClassDecl                          =  4
      EnumDecl                           =  5
      FieldDecl                          =  6
      EnumConstantDecl                   =  7
      FunctionDecl                       =  8
      VarDecl                            =  9
      ParmDecl                           = 10
      ObjCInterfaceDecl                  = 11
      ObjCCategoryDecl                   = 12
      ObjCProtocolDecl                   = 13
      ObjCPropertyDecl                   = 14
      ObjCIvarDecl                       = 15
      ObjCInstanceMethodDecl             = 16
      ObjCClassMethodDecl                = 17
      ObjCImplementationDecl             = 18
      ObjCCategoryImplDecl               = 19
      TypedefDecl                        = 20
      CXXMethod                          = 21
      Namespace                          = 22
      LinkageSpec                        = 23
      Constructor                        = 24
      Destructor                         = 25
      ConversionFunction                 = 26
      TemplateTypeParameter              = 27
      NonTypeTemplateParameter           = 28
      TemplateTemplateParameter          = 29
      FunctionTemplate                   = 30
      ClassTemplate                      = 31
      ClassTemplatePartialSpecialization = 32
      NamespaceAlias                     = 33
      UsingDirective                     = 34
      UsingDeclaration                   = 35
      TypeAliasDecl                      = 36
      ObjCSynthesizeDecl                 = 37
      ObjCDynamicDecl                    = 38
      CXXAccessSpecifier                 = 39
      FirstDecl                          = UnexposedDecl
      LastDecl                           = CXXAccessSpecifier
      FirstRef                           = 40
      ObjCSuperClassRef                  = 40
      ObjCProtocolRef                    = 41
      ObjCClassRef                       = 42
      TypeRef                            = 43
      CXXBaseSpecifier                   = 44
      TemplateRef                        = 45
      NamespaceRef                       = 46
      MemberRef                          = 47
      LabelRef                           = 48
      OverloadedDeclRef                  = 49
      VariableRef                        = 50
      LastRef                            = VariableRef
      FirstInvalid                       = 70
      InvalidFile                        = 70
      NoDeclFound                        = 71
      NotImplemented                     = 72
      InvalidCode                        = 73
      LastInvalid                        = InvalidCode
      FirstExpr                          = 100
      UnexposedExpr                      = 100
      DeclRefExpr                        = 101
      MemberRefExpr                      = 102
      CallExpr                           = 103
      ObjCMessageExpr                    = 104
      BlockExpr                          = 105
      IntegerLiteral                     = 106
      FloatingLiteral                    = 107
      ImaginaryLiteral                   = 108
      StringLiteral                      = 109
      CharacterLiteral                   = 110
      ParenExpr                          = 111
      UnaryOperator                      = 112
      ArraySubscriptExpr                 = 113
      BinaryOperator                     = 114
      CompoundAssignOperator             = 115
      ConditionalOperator                = 116
      CStyleCastExpr                     = 117
      CompoundLiteralExpr                = 118
      InitListExpr                       = 119
      AddrLabelExpr                      = 120
      StmtExpr                           = 121
      GenericSelectionExpr               = 122
      GNUNullExpr                        = 123
      CXXStaticCastExpr                  = 124
      CXXDynamicCastExpr                 = 125
      CXXReinterpretCastExpr             = 126
      CXXConstCastExpr                   = 127
      CXXFunctionalCastExpr              = 128
      CXXTypeidExpr                      = 129
      CXXBoolLiteralExpr                 = 130
      CXXNullPtrLiteralExpr              = 131
      CXXThisExpr                        = 132
      CXXThrowExpr                       = 133
      CXXNewExpr                         = 134
      CXXDeleteExpr                      = 135
      UnaryExpr                          = 136
      ObjCStringLiteral                  = 137
      ObjCEncodeExpr                     = 138
      ObjCSelectorExpr                   = 139
      ObjCProtocolExpr                   = 140
      ObjCBridgedCastExpr                = 141
      PackExpansionExpr                  = 142
      SizeOfPackExpr                     = 143
      LambdaExpr                         = 144
      ObjCBoolLiteralExpr                = 145
      ObjCSelfExpr                       = 146
      LastExpr                           = ObjCSelfExpr
      FirstStmt                          = 200
      UnexposedStmt                      = 200
      LabelStmt                          = 201
      CompoundStmt                       = 202
      CaseStmt                           = 203
      DefaultStmt                        = 204
      IfStmt                             = 205
      SwitchStmt                         = 206
      WhileStmt                          = 207
      DoStmt                             = 208
      ForStmt                            = 209
      GotoStmt                           = 210
      IndirectGotoStmt                   = 211
      ContinueStmt                       = 212
      BreakStmt                          = 213
      ReturnStmt                         = 214
      GCCAsmStmt                         = 215
      AsmStmt                            = GCCAsmStmt
      ObjCAtTryStmt                      = 216
      ObjCAtCatchStmt                    = 217
      ObjCAtFinallyStmt                  = 218
      ObjCAtThrowStmt                    = 219
      ObjCAtSynchronizedStmt             = 220
      ObjCAutoreleasePoolStmt            = 221
      ObjCForCollectionStmt              = 222
      CXXCatchStmt                       = 223
      CXXTryStmt                         = 224
      CXXForRangeStmt                    = 225
      SEHTryStmt                         = 226
      SEHExceptStmt                      = 227
      SEHFinallyStmt                     = 228
      MSAsmStmt                          = 229
      NullStmt                           = 230
      DeclStmt                           = 231
      OMPParallelDirective               = 232
      OMPSimdDirective                   = 233
      OMPForDirective                    = 234
      OMPSectionsDirective               = 235
      OMPSectionDirective                = 236
      OMPSingleDirective                 = 237
      OMPParallelForDirective            = 238
      OMPParallelSectionsDirective       = 239
      OMPTaskDirective                   = 240
      OMPMasterDirective                 = 241
      OMPCriticalDirective               = 242
      OMPTaskyieldDirective              = 243
      OMPBarrierDirective                = 244
      OMPTaskwaitDirective               = 245
      OMPFlushDirective                  = 246
      SEHLeaveStmt                       = 247
      LastStmt                           = SEHLeaveStmt
      TranslationUnit                    = 300
      FirstAttr                          = 400
      UnexposedAttr                      = 400
      IBActionAttr                       = 401
      IBOutletAttr                       = 402
      IBOutletCollectionAttr             = 403
      CXXFinalAttr                       = 404
      CXXOverrideAttr                    = 405
      AnnotateAttr                       = 406
      AsmLabelAttr                       = 407
      PackedAttr                         = 408
      PureAttr                           = 409
      ConstAttr                          = 410
      NoDuplicateAttr                    = 411
      CUDAConstantAttr                   = 412
      CUDADeviceAttr                     = 413
      CUDAGlobalAttr                     = 414
      CUDAHostAttr                       = 415
      LastAttr                           = CUDAHostAttr
      PreprocessingDirective             = 500
      MacroDefinition                    = 501
      MacroExpansion                     = 502
      MacroInstantiation                 = MacroExpansion
      InclusionDirective                 = 503
      FirstPreprocessing                 = PreprocessingDirective
      LastPreprocessing                  = InclusionDirective
      ModuleImportDecl                   = 600
      FirstExtraDecl                     = ModuleImportDecl
      LastExtraDecl                      = ModuleImportDecl
    end
  end

  struct Type
    enum Kind
      # Represents an invalid type (e.g., where no type is available).
      Invalid = 0
      # A type whose specific kind is not exposed via this interface.
      Unexposed           =  1
      Void                =  2
      Bool                =  3
      Char_U              =  4
      UChar               =  5
      Char16              =  6
      Char32              =  7
      UShort              =  8
      UInt                =  9
      ULong               = 10
      ULongLong           = 11
      UInt128             = 12
      Char_S              = 13
      SChar               = 14
      WChar               = 15
      Short               = 16
      Int                 = 17
      Long                = 18
      LongLong            = 19
      Int128              = 20
      Float               = 21
      Double              = 22
      LongDouble          = 23
      NullPtr             = 24
      Overload            = 25
      Dependent           = 26
      ObjCId              = 27
      ObjCClass           = 28
      ObjCSel             = 29
      FirstBuiltin        = Void
      LastBuiltin         = ObjCSel
      Complex             = 100
      Pointer             = 101
      BlockPointer        = 102
      LValueReference     = 103
      RValueReference     = 104
      Record              = 105
      Enum                = 106
      Typedef             = 107
      ObjCInterface       = 108
      ObjCObjectPointer   = 109
      FunctionNoProto     = 110
      FunctionProto       = 111
      ConstantArray       = 112
      Vector              = 113
      IncompleteArray     = 114
      VariableArray       = 115
      DependentSizedArray = 116
      MemberPointer       = 117
      Auto                = 118
      Elaborated          = 119
    end
  end

  struct Token
    enum Kind
      Punctuation
      Keyword
      Identifier
      Literal
      Comment
    end
  end
end
