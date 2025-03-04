import os


def test(
    name: str,
    provider: str,
    test_file: str,
    test_name: str,
    test_args: dict,
    test_kwargs: dict,
    test_vcr: bool = False,
    test_vcr_cassette: str = None,
):
    if test_vcr:
        if test_vcr_cassette is None:
            raise ValueError("test_vcr_cassette must be provided if test_vcr is True")
        else:
            test_vcr_cassette = os.path.join(os.path.dirname(test_file), test_vcr_cassette)
