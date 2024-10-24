export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'translate' : IDL.Func([IDL.Text], [IDL.Text], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
