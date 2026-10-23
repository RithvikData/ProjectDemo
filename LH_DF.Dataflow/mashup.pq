[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "EmpDataInfo_DataDestination", IsNewTarget = false], Settings = [Kind = "Manual", AllowCreation = false, ColumnSettings = [Mappings = {[SourceColumnName = "EmpId", DestinationColumnName = "EmpId"], [SourceColumnName = "EmpName", DestinationColumnName = "EmpName"], [SourceColumnName = "Salary", DestinationColumnName = "Salary"], [SourceColumnName = "DeptName", DestinationColumnName = "DeptName"], [SourceColumnName = "Location", DestinationColumnName = "Location"], [SourceColumnName = "Country", DestinationColumnName = "Country"]}], DynamicSchema = false, UpdateMethod = [Kind = "Append"], TypeSettings = [Kind = "Table"]]]}]
shared EmpDataInfo = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = Variable.ValueOrDefault("$(/**/DynamicConnection/WorkspaceId)", "e77a4556-20db-46d8-9bef-07c6578d7153")]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = Variable.ValueOrDefault("$(/**/DynamicConnection/LakehouseId)", "f9eae0f2-a297-41ac-82ef-5f6211f442fe")]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "EmpDataInfo", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
shared WorkspaceId = Variable.ValueOrDefault("$(/**/DynamicConnection/WorkspaceId)", "e77a4556-20db-46d8-9bef-07c6578d7153");
shared WarehouseId = Variable.ValueOrDefault("$(/**/DynamicConnection/WHId)", "b7aba28d-8bce-46b6-b4b9-58f3f9b75d79");
shared EmpDataInfo_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false, HierarchicalNavigation = null]),
  Navigation_1 = Pattern{[workspaceId = WorkspaceId]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = WarehouseId]}[Data],
  TableNavigation = Navigation_2{[Schema = "dbo", Item = "EmpDataInfo"]}[Data]
in
  TableNavigation;
