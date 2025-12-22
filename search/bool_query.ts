
export interface BoolClause {
  [key: string]: any;
}

export interface BoolQuery {
  must?: BoolClause[];
  should?: BoolClause[];
  must_not?: BoolClause[];
  filter?: BoolClause[];
}

export function boolQuery(params: BoolQuery): BoolQuery {
  return {
    must: params.must ?? [],
    should: params.should ?? [],
    must_not: params.must_not ?? [],
    filter: params.filter ?? []
  };
}
