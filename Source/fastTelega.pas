{************************************************************************}
{                                                                        }
{                              fastTelega                                }
{                                                                        }
{                                                                        }
{ Copyright (c) 2021-2022 fastTelega Project.                            }
{                                                                        }
{ Use of this source code is governed by a BSD-style license that can be }
{ found in the LICENSE file.                                             }
{                                                                        }
{************************************************************************}
unit fastTelega;

interface

{$ALIGN ON}
{$MINENUMSIZE 4}
{$SCOPEDENUMS ON}

uses
  {Delphi}
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {$IFDEF FPC}DateUtils{$ELSE}System.DateUtils{$ENDIF},
  {$IFDEF FPC}Math{$ELSE}System.Math{$ENDIF}.Vectors,
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Types{$ELSE}System.Types{$ENDIF},
  System.UITypes,

  {fastTelega}
  fastTelega.API,
  fastTelega.Bot;

const
  FtVersion = '1.5';

type
  EFtException = class(Exception);

  EFtArgumentException = class(EFtException);

implementation

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  System.IOUtils,
  {$IFDEF FPC}Math{$ELSE}System.Math{$ENDIF},
  System.RTLConsts,
  System.TimeSpan;

const
  SFileNameIsEmpty = 'File name cannot be empty';
  SInvalidExtension = 'Invalid extension';
  SInvalidOperation = 'Operation is invalid';
  SOutOfMemory = 'Out of memory';
  SParamElementIsNil = 'Parameter %s[%d] cannot be nil';
  SParamIsEmpty = 'Parameter %s cannot be empty';
  SParamIsNil = 'Parameter %s cannot be nil';
  SParamOutOfRange = 'Parameter %s out of range (%d). Must be >= %d and < %d';
  SParamSizeIsOdd = 'Parameter %s size cannot be odd';
  SParamSizeMismatch = 'Parameter %s size mismatch';

end.
