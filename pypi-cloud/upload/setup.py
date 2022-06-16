from setuptools import setup, find_packages
import os


with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="cloudopen",
    packages=find_packages(),
    description="PyPI Demo Package for CloudOpen 2022",
    version=os.environ["VERSION"],
    url="https://example.com",
    author="Jaehyun Sim",
    author_email="simjay@simjay.com",
    keywords=["pypi", "cloudopen"],
    install_requires=requirements,
)
