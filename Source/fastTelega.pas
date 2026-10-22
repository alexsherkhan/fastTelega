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
  System.Classes,
  System.DateUtils,
  System.Math.Vectors,
  System.SysUtils,
  System.Types,
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
  System.Generics.Collections,
  System.IOUtils,
  System.Math,
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
