let rec subsetSumOption (L: int list) (s: int) : int list option =
  match L with
  | [] ->
    if s = 0 then Some [] else None
  | head :: tail ->
    match subsetSumOption tail s with
    | Some subset ->
      Some (head :: subset)
    | None ->
      match subsetSumOption tail (s - head) with
      | Some subset ->
        Some (head :: subset)
      | None ->
        None